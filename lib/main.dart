import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Map',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WorldMapPage(),
    );
  }
}

class WorldMapPage extends StatefulWidget {
  const WorldMapPage({super.key});

  @override
  State<WorldMapPage> createState() => _WorldMapPageState();
}

class _WorldMapPageState extends State<WorldMapPage> {
  List<Map<String, dynamic>> countries = [];
  Set<int> selectedCountryIndices = {}; // タップされた国のインデックスを保存
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadGeoJson();
  }

  Future<void> loadGeoJson() async {
    final String data = await rootBundle.loadString('assets/countries.geojson');
    final json = jsonDecode(data);

    final features =
        (json['features'] as List)
            .map((feature) => feature as Map<String, dynamic>)
            .toList();

    // デバッグ: ISO_A3の重複をチェック
    Map<String, List<String>> isoToNames = {};
    for (var feature in features) {
      String iso = feature['properties']['ISO_A3'] ?? 'UNKNOWN';
      String name = feature['properties']['NAME'] ?? 'Unknown';

      if (!isoToNames.containsKey(iso)) {
        isoToNames[iso] = [];
      }
      isoToNames[iso]!.add(name);
    }

    setState(() {
      countries = features;
      isLoading = false;
    });
  }

  List<LatLng> parseCoordinates(List coordinates) {
    return coordinates.map((coord) {
      return LatLng(coord[1].toDouble(), coord[0].toDouble());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('World Map'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('選択: ${selectedCountryIndices.length}か国'),
            ),
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(20, 0),
          initialZoom: 3,
          minZoom: 2,
          maxZoom: 10,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all, // すべてのインタラクション有効
          ),
          onTap: (tapPosition, point) {
            _handleMapTap(point);
          },
        ),
        children: [PolygonLayer(polygons: _buildAllPolygons())],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 選択された国のリストを表示
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text('選択された国'),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          selectedCountryIndices.map((index) {
                            final country = countries[index];
                            final name =
                                country['properties']['NAME'] ?? 'Unknown';
                            final iso =
                                country['properties']['ISO_A3'] ?? 'N/A';
                            return Text('$name ($iso)');
                          }).toList(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('閉じる'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCountryIndices.clear();
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('すべてクリア'),
                    ),
                  ],
                ),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }

  void _handleMapTap(LatLng point) {
    debugPrint('Tapped at: ${point.latitude}, ${point.longitude}');

    int? tappedCountryIndex;
    double smallestArea = double.infinity;

    for (int i = 0; i < countries.length; i++) {
      final country = countries[i];
      final countryName = country['properties']['NAME'] ?? 'Unknown';
      final geometry = country['geometry'];

      if (_isPointInCountry(point, geometry)) {
        debugPrint('Found: $countryName (index: $i)');

        double area = _calculateCountryArea(geometry);

        if (area < smallestArea) {
          smallestArea = area;
          tappedCountryIndex = i;
        }
      }
    }

    if (tappedCountryIndex != null) {
      final selectedName = countries[tappedCountryIndex]['properties']['NAME'];
      debugPrint('Selected: $selectedName');
      setState(() {
        if (selectedCountryIndices.contains(tappedCountryIndex)) {
          selectedCountryIndices.remove(tappedCountryIndex);
        } else {
          selectedCountryIndices.add(tappedCountryIndex!);
        }
      });
    }
  }

  double _calculateCountryArea(Map<String, dynamic> geometry) {
    // 簡易的な面積計算（ポリゴンの点の数で概算）
    int totalPoints = 0;

    if (geometry['type'] == 'Polygon') {
      totalPoints = (geometry['coordinates'][0] as List).length;
    } else if (geometry['type'] == 'MultiPolygon') {
      for (var polygonCoords in geometry['coordinates']) {
        totalPoints += (polygonCoords[0] as List).length;
      }
    }

    return totalPoints.toDouble();
  }

  bool _isPointInCountry(LatLng point, Map<String, dynamic> geometry) {
    if (geometry['type'] == 'Polygon') {
      return _isPointInPolygonWithHoles(point, geometry['coordinates']);
    } else if (geometry['type'] == 'MultiPolygon') {
      for (var polygonCoords in geometry['coordinates']) {
        if (_isPointInPolygonWithHoles(point, polygonCoords)) {
          return true;
        }
      }
    }
    return false;
  }

  // 穴を考慮したポイント判定（新しいメソッド）
  bool _isPointInPolygonWithHoles(LatLng point, List coordinates) {
    // coordinates[0] = 外側の輪郭
    // coordinates[1以降] = 穴（holes）

    // まず外側の輪郭に含まれるかチェック
    if (!_isPointInPolygon(point, parseCoordinates(coordinates[0]))) {
      return false; // 外側の輪郭に含まれていない
    }

    // 穴に含まれていないかチェック
    for (int i = 1; i < coordinates.length; i++) {
      if (_isPointInPolygon(point, parseCoordinates(coordinates[i]))) {
        return false; // 穴の中にある = 国の外
      }
    }

    return true; // 外側に含まれ、穴には含まれない
  }

  bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
    bool inside = false;
    for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
      if ((polygon[i].longitude > point.longitude) !=
              (polygon[j].longitude > point.longitude) &&
          point.latitude <
              (polygon[j].latitude - polygon[i].latitude) *
                      (point.longitude - polygon[i].longitude) /
                      (polygon[j].longitude - polygon[i].longitude) +
                  polygon[i].latitude) {
        inside = !inside;
      }
    }
    return inside;
  }

  List<Polygon> _buildAllPolygons() {
    List<Polygon> allPolygons = [];

    for (int i = 0; i < countries.length; i++) {
      final country = countries[i];
      final isSelected = selectedCountryIndices.contains(i);
      final geometry = country['geometry'];

      final color =
          isSelected
              ? Colors.blue.withValues(alpha: 0.5)
              : Colors.grey.withValues(alpha: 0.3);

      if (geometry['type'] == 'Polygon') {
        // 外側の輪郭のみ描画（ring[0]のみ）
        allPolygons.add(
          Polygon(
            points: parseCoordinates(geometry['coordinates'][0]),
            color: color,
            borderColor: Colors.black,
            borderStrokeWidth: 1,
            // 穴を設定
            holePointsList: _extractHoles(geometry['coordinates']),
          ),
        );
      } else if (geometry['type'] == 'MultiPolygon') {
        for (var polygonCoords in geometry['coordinates']) {
          // 各MultiPolygonの外側の輪郭のみ描画
          allPolygons.add(
            Polygon(
              points: parseCoordinates(polygonCoords[0]),
              color: color,
              borderColor: Colors.black,
              borderStrokeWidth: 1,
              // 穴を設定
              holePointsList: _extractHoles(polygonCoords),
            ),
          );
        }
      }
    }

    return allPolygons;
  }

  // 穴のリストを抽出する新しいメソッド
  List<List<LatLng>> _extractHoles(List coordinates) {
    List<List<LatLng>> holes = [];

    // coordinates[1以降]が穴
    for (int i = 1; i < coordinates.length; i++) {
      holes.add(parseCoordinates(coordinates[i]));
    }

    return holes;
  }
}
