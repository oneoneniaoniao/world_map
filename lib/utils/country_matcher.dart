/// 国名マッチング機能
/// 音声入力された文字列から該当する国を検索する

import 'country_names_data.dart';

/// 国名の検索結果
class CountryMatch {
  final int index;
  final String matchedName; // マッチした名前
  final String nameInGeoJson; // GeoJSONでの国名
  final double confidence; // 0.0 - 1.0 (1.0が完全一致)

  CountryMatch({
    required this.index,
    required this.matchedName,
    required this.nameInGeoJson,
    required this.confidence,
  });

  @override
  String toString() {
    return 'CountryMatch(index: $index, matchedName: "$matchedName", '
        'nameInGeoJson: "$nameInGeoJson", confidence: $confidence)';
  }
}

/// 文字列を正規化（カタカナをひらがなに、小文字に変換など）
/// TODO：　長音記号は統一されていない、全角半角、アクセント記号は考慮されていない
String normalizeString(String input) {
  // 前後の空白を削除
  String normalized = input.trim();

  // カタカナをひらがなに変換
  String kanaConverted = '';
  for (int i = 0; i < normalized.length; i++) {
    int code = normalized.codeUnitAt(i);
    // カタカナ範囲: 0x30A1 - 0x30F6 → ひらがな範囲: 0x3041 - 0x3096
    if (code >= 0x30A1 && code <= 0x30F6) {
      kanaConverted += String.fromCharCode(code - 0x60);
    } else {
      kanaConverted += normalized[i];
    }
  }

  // 英語の場合は小文字に
  return kanaConverted.toLowerCase();
}

/// 音声入力された文字列から国を検索
List<CountryMatch> findCountries(
  String input,
  List<Map<String, dynamic>> countries,
) {
  if (input.trim().isEmpty) {
    return [];
  }

  final normalizedInput = normalizeString(input);
  final results = <CountryMatch>[];
  final foundIndices = <int>{};

  // 1. 完全一致を探す
  for (var entry in countryNamesData.entries) {
    final geoJsonName = entry.key;
    final aliases = entry.value;

    // すべての別名をチェック
    for (var languageAliases in aliases.values) {
      for (var alias in languageAliases) {
        final normalizedAlias = normalizeString(alias);

        if (normalizedAlias == normalizedInput) {
          // GeoJSONから該当する国を探す
          for (int i = 0; i < countries.length; i++) {
            if (foundIndices.contains(i)) continue;

            final countryName = countries[i]['properties']['NAME'] ?? '';
            final countryNameLong =
                countries[i]['properties']['NAME_LONG'] ?? '';

            // GeoJSONの国名と一致するか確認
            if (normalizeString(countryName) == normalizeString(geoJsonName) ||
                normalizeString(countryNameLong) ==
                    normalizeString(geoJsonName) ||
                countryName == geoJsonName ||
                countryNameLong == geoJsonName) {
              results.add(
                CountryMatch(
                  index: i,
                  matchedName: alias,
                  nameInGeoJson: countryName,
                  confidence: 1.0,
                ),
              );
              foundIndices.add(i);
              break;
            }
          }
        }
      }
    }
  }

  // 2. 部分一致を探す（完全一致が見つからない場合）
  if (results.isEmpty) {
    for (var entry in countryNamesData.entries) {
      final geoJsonName = entry.key;
      final aliases = entry.value;

      // すべての別名をチェック
      for (var languageAliases in aliases.values) {
        for (var alias in languageAliases) {
          final normalizedAlias = normalizeString(alias);

          // 部分一致をチェック
          if (normalizedAlias.contains(normalizedInput) ||
              normalizedInput.contains(normalizedAlias)) {
            // GeoJSONから該当する国を探す
            for (int i = 0; i < countries.length; i++) {
              if (foundIndices.contains(i)) continue;

              final countryName = countries[i]['properties']['NAME'] ?? '';
              final countryNameLong =
                  countries[i]['properties']['NAME_LONG'] ?? '';

              // GeoJSONの国名と一致するか確認
              if (normalizeString(countryName) ==
                      normalizeString(geoJsonName) ||
                  normalizeString(countryNameLong) ==
                      normalizeString(geoJsonName) ||
                  countryName == geoJsonName ||
                  countryNameLong == geoJsonName) {
                // 信頼度を計算（マッチの質に基づいて）
                double confidence = 0.5;
                if (normalizedAlias.startsWith(normalizedInput) ||
                    normalizedInput.startsWith(normalizedAlias)) {
                  confidence = 0.7; // 前方一致の方が信頼度が高い
                }

                results.add(
                  CountryMatch(
                    index: i,
                    matchedName: alias,
                    nameInGeoJson: countryName,
                    confidence: confidence,
                  ),
                );
                foundIndices.add(i);
                break;
              }
            }
          }
        }
      }
    }
  }

  // 信頼度でソート（高い順）
  results.sort((a, b) {
    final confCompare = b.confidence.compareTo(a.confidence);
    if (confCompare != 0) return confCompare;
    // 信頼度が同じ場合は、マッチした名前の長さでソート（短い方が優先）
    return a.matchedName.length.compareTo(b.matchedName.length);
  });

  return results;
}
