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
  Set<String> selectedCountries = {}; // タップされた国のIDを保存
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadGeoJson();
  }

  Future<void> loadGeoJson() async {
    final String data = await rootBundle.loadString('assets/countries.geojson');
    final json = jsonDecode(data);

    setState(() {
      countries =
          (json['features'] as List)
              .map((feature) => feature as Map<String, dynamic>)
              .toList();
      isLoading = false;
    });
  }

  List<LatLng> parseCoordinates(List coordinates) {
    return coordinates.map((coord) {
      return LatLng(coord[1].toDouble(), coord[0].toDouble());
    }).toList();
  }

  @override
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('World Map')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(20, 0),
          initialZoom: 2,
          onTap: (tapPosition, point) {
            // タップ処理（次のステップで実装）
          },
        ),
        children: [PolygonLayer(polygons: _buildAllPolygons())],
      ),
    );
  }

  List<Polygon> _buildAllPolygons() {
    List<Polygon> allPolygons = [];

    for (var country in countries) {
      final countryId = country['properties']['ISO_A3'] ?? '';
      final isSelected = selectedCountries.contains(countryId);
      final geometry = country['geometry'];

      final color =
          isSelected
              ? Colors.blue.withOpacity(0.5)
              : Colors.grey.withOpacity(0.3);

      if (geometry['type'] == 'Polygon') {
        // 単一ポリゴン
        allPolygons.add(
          Polygon(
            points: parseCoordinates(geometry['coordinates'][0]),
            color: color,
            borderColor: Colors.black,
            borderStrokeWidth: 1,
          ),
        );
      } else if (geometry['type'] == 'MultiPolygon') {
        // 複数ポリゴン（すべて描画）
        for (var polygonCoords in geometry['coordinates']) {
          allPolygons.add(
            Polygon(
              points: parseCoordinates(polygonCoords[0]),
              color: color,
              borderColor: Colors.black,
              borderStrokeWidth: 1,
            ),
          );
        }
      }
    }

    return allPolygons;
  }
}
