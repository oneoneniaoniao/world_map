import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../utils/geo_utils.dart';
import '../utils/country_matcher.dart';

class SearchMapPage extends StatefulWidget {
  const SearchMapPage({super.key});

  @override
  State<SearchMapPage> createState() => _SearchMapPageState();
}

class _SearchMapPageState extends State<SearchMapPage> {
  List<Map<String, dynamic>> countries = [];
  Set<int> selectedCountryIndices = {}; // テキスト入力で選択された国のインデックスを保存
  bool isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadGeoJson();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadGeoJson() async {
    final String data = await rootBundle.loadString('assets/countries.geojson');
    final json = jsonDecode(data);

    final features = (json['features'] as List)
        .map((feature) => feature as Map<String, dynamic>)
        .toList();

    setState(() {
      countries = features;
      isLoading = false;
    });
  }

  void _onSearchButtonPressed() {
    final query = _searchController.text;
    if (query.trim().isEmpty) {
      setState(() {
        selectedCountryIndices.clear();
      });
      return;
    }

    final matches = findCountries(query, countries);
    setState(() {
      selectedCountryIndices = matches.map((match) => match.index).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('入力で選択'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('選択: ${selectedCountryIndices.length}か国'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: '国名を入力してください',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _onSearchButtonPressed,
                  child: const Text('決定'),
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: const LatLng(33, 135),
                initialZoom: 4,
                minZoom: 3,
                maxZoom: 10,
                // 回転を無効化（常に北を上に保つ）
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
                // タップ機能を無効化
              ),
              children: [
                PolygonLayer(polygons: _buildAllPolygons()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSelectedCountriesDialog();
        },
        child: const Icon(Icons.list),
      ),
    );
  }

  List<Polygon> _buildAllPolygons() {
    List<Polygon> allPolygons = [];

    for (int i = 0; i < countries.length; i++) {
      final country = countries[i];
      final isSelected = selectedCountryIndices.contains(i);
      final geometry = country['geometry'];

      final color = isSelected
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
      builder: (context) => AlertDialog(
        title: const Text('選択された国'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: selectedCountryIndices.map((index) {
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
