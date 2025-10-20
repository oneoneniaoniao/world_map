import 'package:latlong2/latlong.dart';

/// 座標リストをLatLngオブジェクトのリストに変換
List<LatLng> parseCoordinates(List coordinates) {
  return coordinates.map((coord) {
    return LatLng(coord[1].toDouble(), coord[0].toDouble());
  }).toList();
}

/// 点がポリゴン内にあるか判定（Ray Casting Algorithm）
bool isPointInPolygon(LatLng point, List<LatLng> polygon) {
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

/// 穴を考慮したポリゴン判定
bool isPointInPolygonWithHoles(LatLng point, List coordinates) {
  // coordinates[0] = 外側の輪郭
  // coordinates[1以降] = 穴（holes）

  // まず外側の輪郭に含まれるかチェック
  if (!isPointInPolygon(point, parseCoordinates(coordinates[0]))) {
    return false; // 外側の輪郭に含まれていない
  }

  // 穴に含まれていないかチェック
  for (int i = 1; i < coordinates.length; i++) {
    if (isPointInPolygon(point, parseCoordinates(coordinates[i]))) {
      return false; // 穴の中にある = 国の外
    }
  }

  return true; // 外側に含まれ、穴には含まれない
}

/// 点が国のジオメトリ内にあるか判定
bool isPointInCountry(LatLng point, Map<String, dynamic> geometry) {
  if (geometry['type'] == 'Polygon') {
    return isPointInPolygonWithHoles(point, geometry['coordinates']);
  } else if (geometry['type'] == 'MultiPolygon') {
    for (var polygonCoords in geometry['coordinates']) {
      if (isPointInPolygonWithHoles(point, polygonCoords)) {
        return true;
      }
    }
  }
  return false;
}

/// 国の面積を簡易計算（ポリゴンの点の数で概算）
double calculateCountryArea(Map<String, dynamic> geometry) {
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

/// ポリゴンの穴を抽出
List<List<LatLng>> extractHoles(List coordinates) {
  List<List<LatLng>> holes = [];

  // coordinates[1以降]が穴
  for (int i = 1; i < coordinates.length; i++) {
    holes.add(parseCoordinates(coordinates[i]));
  }

  return holes;
}
