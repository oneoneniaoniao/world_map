# World Map - 世界地図アプリ

Flutterで開発されたインタラクティブな世界地図アプリケーションです。GeoJSONデータを使用して世界の国々を表示し、複数の方法で国を選択・検索できます。

## 機能

### 1. リアルタイム検索（World Map）
- テキスト入力でリアルタイムに国を検索
- 入力と同時に該当する国が地図上でハイライト表示
- 日本語・英語の国名に対応

### 2. 入力で選択（Search Map）
- 検索ボックスに国名を入力して「決定」ボタンで検索
- 複数の国を一度に選択可能
- 選択された国のリストを確認可能

### 3. タップで選択（Tap Map）
- 地図上の国を直接タップして選択
- 複数の国を選択・解除可能
- 選択された国の情報を表示

## 技術スタック

- **Flutter** 3.7.0+
- **flutter_map** - 地図表示ライブラリ
- **latlong2** - 座標処理
- **GeoJSON** - 地理データ形式

## セットアップ

### 必要な環境

- Flutter SDK 3.7.0以上
- Dart SDK
- Chrome（Web開発用）

### インストール手順

- 依存関係をインストール
```bash
flutter pub get
```

- アプリを実行
```bash
# Web版
flutter run -d chrome

# モバイル版（Android/iOS）
flutter run
```

## ビルド

### Web版のビルド

```bash
flutter build web
```

ビルドされたファイルは `build/web/` ディレクトリに生成されます。

## Web公開方法

ビルドが完了したら、以下のいずれかの方法でWeb公開できます。

### 方法1: GitHub Pages（推奨）

1. GitHubリポジトリにプッシュ
```bash
git add .
git commit -m "Web公開準備"
git push origin main
```

2. GitHubリポジトリの設定
   - Settings → Pages
   - Source: `Deploy from a branch`
   - Branch: `gh-pages` または `main` / `build/web`
   - フォルダ: `/build/web`

3. または、`gh-pages`ブランチを作成してビルドファイルをプッシュ
```bash
# build/webの内容をgh-pagesブランチにプッシュ
git subtree push --prefix build/web origin gh-pages
```

### 方法2: Firebase Hosting

1. Firebase CLIをインストール
```bash
npm install -g firebase-tools
```

2. Firebaseにログイン
```bash
firebase login
```

3. プロジェクトを初期化
```bash
firebase init hosting
# 公開ディレクトリ: build/web
```

4. デプロイ
```bash
flutter build web
firebase deploy
```

### 方法3: Netlify

1. Netlifyアカウントを作成
2. 新しいサイトを作成
3. ビルド設定:
   - Build command: `flutter build web`
   - Publish directory: `build/web`
4. GitHubと連携して自動デプロイ

### 方法4: Vercel

1. Vercel CLIをインストール
```bash
npm install -g vercel
```

2. デプロイ
```bash
flutter build web
cd build/web
vercel
```

### 方法5: その他のホスティングサービス

`build/web` ディレクトリの内容を、以下のようなサービスにアップロードできます：
- AWS S3 + CloudFront
- Google Cloud Storage
- Azure Static Web Apps
- その他の静的ホスティングサービス

## プロジェクト構造

```
lib/
├── main.dart                 # アプリのエントリーポイント
├── pages/
│   ├── home_page.dart        # ホーム画面
│   ├── world_map_page.dart   # リアルタイム検索画面
│   ├── search_map_page.dart  # 入力で選択画面
│   └── tap_map_page.dart     # タップで選択画面
├── utils/
│   ├── geo_utils.dart        # 地理計算ユーティリティ
│   └── country_matcher.dart  # 国名マッチング機能
└── data/
    └── country_names_data.dart # 国名データ

assets/
└── countries.geojson          # 世界地図のGeoJSONデータ

web/                           # Web用設定ファイル
build/web/                     # ビルド出力（Web公開用）
```

## 主な機能の実装

### 国名検索
- 日本語・英語の国名に対応
- 部分一致検索
- カタカナ/ひらがなの自動変換

### 地理計算
- Ray Casting Algorithmによる点とポリゴンの判定
- MultiPolygon対応
- 穴（holes）を考慮したポリゴン判定

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## 開発者向け情報

### デバッグモードで実行
```bash
flutter run -d chrome --web-renderer html
```

### リリースモードでビルド
```bash
flutter build web --release
```

### パフォーマンス最適化
- CanvasKitレンダラーを使用する場合:
```bash
flutter build web --web-renderer canvaskit
```

## トラブルシューティング

### ビルドエラーが発生する場合
```bash
flutter clean
flutter pub get
flutter build web
```

### 地図が表示されない場合
- `assets/countries.geojson` が正しく配置されているか確認
- `pubspec.yaml` の `assets` セクションを確認

## 今後の改善予定

- [ ] 音声認識機能の実装
- [ ] 選択した国の統計情報表示
- [ ] エクスポート機能（CSV、JSON）
- [ ] ダークモード対応
- [ ] 多言語対応の拡充
