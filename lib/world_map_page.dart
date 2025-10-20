import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'geo_utils.dart';

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

    setState(() {
      countries = features;
      isLoading = false;
    });
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
          _showSelectedCountriesDialog();
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

      if (isPointInCountry(point, geometry)) {
        debugPrint('Found: $countryName (index: $i)');

        double area = calculateCountryArea(geometry);

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
            holePointsList: extractHoles(geometry['coordinates']),
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
              holePointsList: extractHoles(polygonCoords),
            ),
          );
        }
      }
    }

    return allPolygons;
  }

  void _showSelectedCountriesDialog() {
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
                      final name = country['properties']['NAME'] ?? 'Unknown';
                      final iso = country['properties']['ISO_A3'] ?? 'N/A';
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
  }
}
