/// 国名データ（全242カ国対応）
///
/// 構造: GeoJSONの国名 -> { 言語コード -> [別名のリスト] }
///
/// 例:
/// 'Japan': {
///   'ja': ['日本', 'にほん', 'ニホン'],
///   'en': ['Japan', 'Nippon'],
/// }

final Map<String, Map<String, List<String>>> countryNamesData = {
  // === 東アジア ===
  'Japan': {
    'ja': ['日本', 'にほん', 'ニホン', 'にっぽん', 'ニッポン'],
    'en': ['Japan', 'Nippon'],
  },
  'China': {
    'ja': ['中国', 'ちゅうごく', 'チュウゴク', '中華人民共和国'],
    'en': ['China', 'PRC', 'People\'s Republic of China'],
  },
  'South Korea': {
    'ja': ['韓国', 'かんこく', 'カンコク', '大韓民国', 'だいかんみんこく'],
    'en': ['South Korea', 'Korea', 'Republic of Korea', 'ROK'],
  },
  'North Korea': {
    'ja': ['北朝鮮', 'きたちょうせん', 'キタチョウセン', '朝鮮民主主義人民共和国'],
    'en': [
      'North Korea',
      'DPRK',
      'Democratic People\'s Republic of Korea',
      'Dem. Rep. Korea',
    ],
  },
  'Mongolia': {
    'ja': ['モンゴル', 'もんごる'],
    'en': ['Mongolia'],
  },
  'Taiwan': {
    'ja': ['台湾', 'たいわん', 'タイワン'],
    'en': ['Taiwan', 'Chinese Taipei'],
  },
  'Hong Kong': {
    'ja': ['香港', 'ほんこん', 'ホンコン'],
    'en': ['Hong Kong', 'HK'],
  },
  'Macao': {
    'ja': ['マカオ', 'まかお', 'マカオ', '澳門'],
    'en': ['Macao', 'Macau'],
  },

  // === 東南アジア ===
  'Thailand': {
    'ja': ['タイ', 'たい'],
    'en': ['Thailand', 'Siam'],
  },
  'Vietnam': {
    'ja': ['ベトナム', 'べとなむ'],
    'en': ['Vietnam', 'Viet Nam'],
  },
  'Philippines': {
    'ja': ['フィリピン', 'ふぃりぴん'],
    'en': ['Philippines', 'Philippine'],
  },
  'Indonesia': {
    'ja': ['インドネシア', 'いんどねしあ'],
    'en': ['Indonesia'],
  },
  'Malaysia': {
    'ja': ['マレーシア', 'まれーしあ'],
    'en': ['Malaysia'],
  },
  'Singapore': {
    'ja': ['シンガポール', 'しんがぽーる'],
    'en': ['Singapore'],
  },
  'Myanmar': {
    'ja': ['ミャンマー', 'みゃんまー', 'ビルマ', 'びるま'],
    'en': ['Myanmar', 'Burma'],
  },
  'Cambodia': {
    'ja': ['カンボジア', 'かんぼじあ'],
    'en': ['Cambodia', 'Kampuchea'],
  },
  'Laos': {
    'ja': ['ラオス', 'らおす'],
    'en': ['Laos', 'Lao', 'Lao PDR'],
  },
  'Brunei': {
    'ja': ['ブルネイ', 'ぶるねい'],
    'en': ['Brunei', 'Brunei Darussalam'],
  },
  'Timor-Leste': {
    'ja': ['東ティモール', 'ひがしてぃもーる', 'ティモール'],
    'en': ['Timor-Leste', 'East Timor'],
  },

  // === 南アジア ===
  'India': {
    'ja': ['インド', 'いんど'],
    'en': ['India', 'Bharat'],
  },
  'Pakistan': {
    'ja': ['パキスタン', 'ぱきすたん'],
    'en': ['Pakistan'],
  },
  'Bangladesh': {
    'ja': ['バングラデシュ', 'ばんぐらでしゅ'],
    'en': ['Bangladesh'],
  },
  'Sri Lanka': {
    'ja': ['スリランカ', 'すりらんか', 'セイロン', 'せいろん'],
    'en': ['Sri Lanka', 'Ceylon'],
  },
  'Nepal': {
    'ja': ['ネパール', 'ねぱーる'],
    'en': ['Nepal'],
  },
  'Bhutan': {
    'ja': ['ブータン', 'ぶーたん'],
    'en': ['Bhutan'],
  },
  'Maldives': {
    'ja': ['モルディブ', 'もるでぃぶ'],
    'en': ['Maldives'],
  },
  'Afghanistan': {
    'ja': ['アフガニスタン', 'あふがにすたん'],
    'en': ['Afghanistan'],
  },

  // === 中央アジア ===
  'Kazakhstan': {
    'ja': ['カザフスタン', 'かざふすたん'],
    'en': ['Kazakhstan'],
  },
  'Uzbekistan': {
    'ja': ['ウズベキスタン', 'うずべきすたん'],
    'en': ['Uzbekistan'],
  },
  'Turkmenistan': {
    'ja': ['トルクメニスタン', 'とるくめにすたん'],
    'en': ['Turkmenistan'],
  },
  'Kyrgyzstan': {
    'ja': ['キルギス', 'きるぎす', 'キルギスタン'],
    'en': ['Kyrgyzstan', 'Kirghizia'],
  },
  'Tajikistan': {
    'ja': ['タジキスタン', 'たじきすたん'],
    'en': ['Tajikistan'],
  },

  // === 中東 ===
  'Saudi Arabia': {
    'ja': ['サウジアラビア', 'さうじあらびあ'],
    'en': ['Saudi Arabia', 'Saudi'],
  },
  'Iran': {
    'ja': ['イラン', 'いらん', 'ペルシャ', 'ぺるしゃ'],
    'en': ['Iran', 'Persia'],
  },
  'Iraq': {
    'ja': ['イラク', 'いらく'],
    'en': ['Iraq'],
  },
  'Turkey': {
    'ja': ['トルコ', 'とるこ', 'テュルキエ', 'てゅるきえ'],
    'en': ['Turkey', 'Türkiye'],
  },
  'Israel': {
    'ja': ['イスラエル', 'いすらえる'],
    'en': ['Israel'],
  },
  'Jordan': {
    'ja': ['ヨルダン', 'よるだん'],
    'en': ['Jordan'],
  },
  'Lebanon': {
    'ja': ['レバノン', 'ればのん'],
    'en': ['Lebanon'],
  },
  'Syria': {
    'ja': ['シリア', 'しりあ'],
    'en': ['Syria', 'Syrian Arab Republic'],
  },
  'Yemen': {
    'ja': ['イエメン', 'いえめん'],
    'en': ['Yemen'],
  },
  'Oman': {
    'ja': ['オマーン', 'おまーん'],
    'en': ['Oman'],
  },
  'United Arab Emirates': {
    'ja': ['アラブ首長国連邦', 'あらぶしゅちょうこくれんぽう', 'UAE', 'ゆーえーいー'],
    'en': ['United Arab Emirates', 'UAE', 'Emirates'],
  },
  'Kuwait': {
    'ja': ['クウェート', 'くうぇーと'],
    'en': ['Kuwait'],
  },
  'Qatar': {
    'ja': ['カタール', 'かたーる'],
    'en': ['Qatar'],
  },
  'Bahrain': {
    'ja': ['バーレーン', 'ばーれーん'],
    'en': ['Bahrain'],
  },
  'Palestine': {
    'ja': ['パレスチナ', 'ぱれすちな'],
    'en': ['Palestine'],
  },
  'Cyprus': {
    'ja': ['キプロス', 'きぷろす'],
    'en': ['Cyprus'],
  },
  'Armenia': {
    'ja': ['アルメニア', 'あるめにあ'],
    'en': ['Armenia'],
  },
  'Azerbaijan': {
    'ja': ['アゼルバイジャン', 'あぜるばいじゃん'],
    'en': ['Azerbaijan'],
  },
  'Georgia': {
    'ja': ['ジョージア', 'じょーじあ', 'グルジア', 'ぐるじあ'],
    'en': ['Georgia'],
  },

  // === ヨーロッパ（西欧）===
  'United Kingdom': {
    'ja': [
      'イギリス',
      'いぎりす',
      'イングランド',
      'いんぐらんど',
      '英国',
      'えいこく',
      'グレートブリテンおよび北アイルランド連合王国',
    ],
    'en': ['United Kingdom', 'UK', 'Britain', 'Great Britain', 'England'],
  },
  'France': {
    'ja': ['フランス', 'ふらんす', '仏国', 'ふっこく'],
    'en': ['France'],
  },
  'Germany': {
    'ja': ['ドイツ', 'どいつ', '独国', 'どくこく'],
    'en': ['Germany', 'Deutschland'],
  },
  'Italy': {
    'ja': ['イタリア', 'いたりあ'],
    'en': ['Italy', 'Italia'],
  },
  'Spain': {
    'ja': ['スペイン', 'すぺいん'],
    'en': ['Spain', 'España'],
  },
  'Portugal': {
    'ja': ['ポルトガル', 'ぽるとがる'],
    'en': ['Portugal'],
  },
  'Netherlands': {
    'ja': ['オランダ', 'おらんだ', 'ネーデルランド', 'ねーでるらんど'],
    'en': ['Netherlands', 'Holland'],
  },
  'Belgium': {
    'ja': ['ベルギー', 'べるぎー'],
    'en': ['Belgium'],
  },
  'Switzerland': {
    'ja': ['スイス', 'すいす'],
    'en': ['Switzerland', 'Swiss'],
  },
  'Austria': {
    'ja': ['オーストリア', 'おーすとりあ'],
    'en': ['Austria'],
  },
  'Luxembourg': {
    'ja': ['ルクセンブルク', 'るくせんぶるく'],
    'en': ['Luxembourg'],
  },
  'Monaco': {
    'ja': ['モナコ', 'もなこ'],
    'en': ['Monaco'],
  },
  'Liechtenstein': {
    'ja': ['リヒテンシュタイン', 'りひてんしゅたいん'],
    'en': ['Liechtenstein'],
  },
  'Andorra': {
    'ja': ['アンドラ', 'あんどら'],
    'en': ['Andorra'],
  },
  'San Marino': {
    'ja': ['サンマリノ', 'さんまりの'],
    'en': ['San Marino'],
  },
  'Vatican': {
    'ja': ['バチカン', 'ばちかん', 'バチカン市国'],
    'en': ['Vatican', 'Vatican City'],
  },
  'Ireland': {
    'ja': ['アイルランド', 'あいるらんど'],
    'en': ['Ireland'],
  },

  // === ヨーロッパ（北欧）===
  'Sweden': {
    'ja': ['スウェーデン', 'すうぇーでん'],
    'en': ['Sweden'],
  },
  'Norway': {
    'ja': ['ノルウェー', 'のるうぇー'],
    'en': ['Norway'],
  },
  'Denmark': {
    'ja': ['デンマーク', 'でんまーく'],
    'en': ['Denmark'],
  },
  'Finland': {
    'ja': ['フィンランド', 'ふぃんらんど'],
    'en': ['Finland'],
  },
  'Iceland': {
    'ja': ['アイスランド', 'あいすらんど'],
    'en': ['Iceland'],
  },

  // === ヨーロッパ（東欧）===
  'Poland': {
    'ja': ['ポーランド', 'ぽーらんど'],
    'en': ['Poland'],
  },
  'Czechia': {
    'ja': ['チェコ', 'ちぇこ'],
    'en': ['Czechia', 'Czech Republic'],
  },
  'Slovakia': {
    'ja': ['スロバキア', 'すろばきあ'],
    'en': ['Slovakia'],
  },
  'Hungary': {
    'ja': ['ハンガリー', 'はんがりー'],
    'en': ['Hungary'],
  },
  'Romania': {
    'ja': ['ルーマニア', 'るーまにあ'],
    'en': ['Romania'],
  },
  'Bulgaria': {
    'ja': ['ブルガリア', 'ぶるがりあ'],
    'en': ['Bulgaria'],
  },
  'Ukraine': {
    'ja': ['ウクライナ', 'うくらいな'],
    'en': ['Ukraine'],
  },
  'Belarus': {
    'ja': ['ベラルーシ', 'べらるーし', '白ロシア', 'しろろしあ'],
    'en': ['Belarus', 'Byelorussia'],
  },
  'Moldova': {
    'ja': ['モルドバ', 'もるどば'],
    'en': ['Moldova'],
  },
  'Russia': {
    'ja': ['ロシア', 'ろしあ', 'ロシア連邦'],
    'en': ['Russia', 'Russian Federation'],
  },
  'Estonia': {
    'ja': ['エストニア', 'えすとにあ'],
    'en': ['Estonia'],
  },
  'Latvia': {
    'ja': ['ラトビア', 'らとびあ'],
    'en': ['Latvia'],
  },
  'Lithuania': {
    'ja': ['リトアニア', 'りとあにあ'],
    'en': ['Lithuania'],
  },

  // === ヨーロッパ（南欧・バルカン）===
  'Greece': {
    'ja': ['ギリシャ', 'ぎりしゃ', 'ギリシア', 'ぎりしあ'],
    'en': ['Greece', 'Hellenic Republic'],
  },
  'Croatia': {
    'ja': ['クロアチア', 'くろあちあ'],
    'en': ['Croatia'],
  },
  'Serbia': {
    'ja': ['セルビア', 'せるびあ'],
    'en': ['Serbia'],
  },
  'Bosnia and Herzegovina': {
    'ja': ['ボスニア・ヘルツェゴビナ', 'ぼすにあへるつぇごびな', 'ボスニア'],
    'en': ['Bosnia and Herzegovina', 'Bosnia and Herz.'],
  },
  'Slovenia': {
    'ja': ['スロベニア', 'すろべにあ'],
    'en': ['Slovenia'],
  },
  'Montenegro': {
    'ja': ['モンテネグロ', 'もんてねぐろ'],
    'en': ['Montenegro'],
  },
  'North Macedonia': {
    'ja': ['北マケドニア', 'きたまけどにあ', 'マケドニア'],
    'en': ['North Macedonia', 'Macedonia'],
  },
  'Albania': {
    'ja': ['アルバニア', 'あるばにあ'],
    'en': ['Albania'],
  },
  'Kosovo': {
    'ja': ['コソボ', 'こそぼ'],
    'en': ['Kosovo'],
  },
  'Malta': {
    'ja': ['マルタ', 'まるた'],
    'en': ['Malta'],
  },

  // === アフリカ（北部）===
  'Egypt': {
    'ja': ['エジプト', 'えじぷと'],
    'en': ['Egypt'],
  },
  'Morocco': {
    'ja': ['モロッコ', 'もろっこ'],
    'en': ['Morocco'],
  },
  'Algeria': {
    'ja': ['アルジェリア', 'あるじぇりあ'],
    'en': ['Algeria'],
  },
  'Tunisia': {
    'ja': ['チュニジア', 'ちゅにじあ'],
    'en': ['Tunisia'],
  },
  'Libya': {
    'ja': ['リビア', 'りびあ'],
    'en': ['Libya'],
  },
  'Sudan': {
    'ja': ['スーダン', 'すーだん'],
    'en': ['Sudan'],
  },
  'South Sudan': {
    'ja': ['南スーダン', 'みなみすーだん'],
    'en': ['South Sudan', 'S. Sudan'],
  },

  // === アフリカ（西部）===
  'Nigeria': {
    'ja': ['ナイジェリア', 'ないじぇりあ'],
    'en': ['Nigeria'],
  },
  'Ghana': {
    'ja': ['ガーナ', 'がーな'],
    'en': ['Ghana'],
  },
  'Senegal': {
    'ja': ['セネガル', 'せねがる'],
    'en': ['Senegal'],
  },
  'Mali': {
    'ja': ['マリ', 'まり'],
    'en': ['Mali'],
  },
  'Burkina Faso': {
    'ja': ['ブルキナファソ', 'ぶるきなふぁそ'],
    'en': ['Burkina Faso'],
  },
  'Niger': {
    'ja': ['ニジェール', 'にじぇーる'],
    'en': ['Niger'],
  },
  'Côte d\'Ivoire': {
    'ja': ['コートジボワール', 'こーとじぼわーる', '象牙海岸'],
    'en': ['Côte d\'Ivoire', 'Ivory Coast'],
  },
  'Guinea': {
    'ja': ['ギニア', 'ぎにあ'],
    'en': ['Guinea'],
  },
  'Guinea-Bissau': {
    'ja': ['ギニアビサウ', 'ぎにあびさう'],
    'en': ['Guinea-Bissau'],
  },
  'Equatorial Guinea': {
    'ja': ['赤道ギニア', 'せきどうぎにあ'],
    'en': ['Equatorial Guinea', 'Eq. Guinea'],
  },
  'Sierra Leone': {
    'ja': ['シエラレオネ', 'しえられおね'],
    'en': ['Sierra Leone'],
  },
  'Liberia': {
    'ja': ['リベリア', 'りべりあ'],
    'en': ['Liberia'],
  },
  'Mauritania': {
    'ja': ['モーリタニア', 'もーりたにあ'],
    'en': ['Mauritania'],
  },
  'Gambia': {
    'ja': ['ガンビア', 'がんびあ'],
    'en': ['Gambia', 'The Gambia'],
  },
  'Togo': {
    'ja': ['トーゴ', 'とーご'],
    'en': ['Togo'],
  },
  'Benin': {
    'ja': ['ベナン', 'べなん'],
    'en': ['Benin'],
  },
  'Cabo Verde': {
    'ja': ['カーボベルデ', 'かーぼべるで', 'カーボヴェルデ'],
    'en': ['Cabo Verde', 'Cape Verde', 'Republic of Cabo Verde'],
  },

  // === アフリカ（中部）===
  'Cameroon': {
    'ja': ['カメルーン', 'かめるーん'],
    'en': ['Cameroon'],
  },
  'Central African Republic': {
    'ja': ['中央アフリカ', 'ちゅうおうあふりか', '中央アフリカ共和国'],
    'en': ['Central African Republic', 'Central African Rep.'],
  },
  'Chad': {
    'ja': ['チャド', 'ちゃど'],
    'en': ['Chad'],
  },
  'Republic of the Congo': {
    'ja': ['コンゴ共和国', 'こんごきょうわこく', 'コンゴ'],
    'en': ['Republic of the Congo', 'Congo'],
  },
  'Democratic Republic of the Congo': {
    'ja': ['コンゴ民主共和国', 'こんごみんしゅきょうわこく', '民主コンゴ'],
    'en': ['Democratic Republic of the Congo', 'Dem. Rep. Congo', 'DRC'],
  },
  'Gabon': {
    'ja': ['ガボン', 'がぼん'],
    'en': ['Gabon'],
  },
  'São Tomé and Principe': {
    'ja': ['サントメ・プリンシペ', 'さんとめぷりんしぺ'],
    'en': ['São Tomé and Principe'],
  },

  // === アフリカ（東部）===
  'Kenya': {
    'ja': ['ケニア', 'けにあ'],
    'en': ['Kenya'],
  },
  'Ethiopia': {
    'ja': ['エチオピア', 'えちおぴあ'],
    'en': ['Ethiopia'],
  },
  'Tanzania': {
    'ja': ['タンザニア', 'たんざにあ'],
    'en': ['Tanzania'],
  },
  'Uganda': {
    'ja': ['ウガンダ', 'うがんだ'],
    'en': ['Uganda'],
  },
  'Somalia': {
    'ja': ['ソマリア', 'そまりあ'],
    'en': ['Somalia'],
  },
  'Eritrea': {
    'ja': ['エリトリア', 'えりとりあ'],
    'en': ['Eritrea'],
  },
  'Djibouti': {
    'ja': ['ジブチ', 'じぶち'],
    'en': ['Djibouti'],
  },
  'Rwanda': {
    'ja': ['ルワンダ', 'るわんだ'],
    'en': ['Rwanda'],
  },
  'Burundi': {
    'ja': ['ブルンジ', 'ぶるんじ'],
    'en': ['Burundi'],
  },

  // === アフリカ（南部）===
  'South Africa': {
    'ja': ['南アフリカ', 'みなみあふりか', '南ア', 'みなみあ'],
    'en': ['South Africa', 'RSA'],
  },
  'Zimbabwe': {
    'ja': ['ジンバブエ', 'じんばぶえ'],
    'en': ['Zimbabwe'],
  },
  'Zambia': {
    'ja': ['ザンビア', 'ざんびあ'],
    'en': ['Zambia'],
  },
  'Mozambique': {
    'ja': ['モザンビーク', 'もざんびーく'],
    'en': ['Mozambique'],
  },
  'Malawi': {
    'ja': ['マラウイ', 'まらうい'],
    'en': ['Malawi'],
  },
  'Botswana': {
    'ja': ['ボツワナ', 'ぼつわな'],
    'en': ['Botswana'],
  },
  'Namibia': {
    'ja': ['ナミビア', 'なみびあ'],
    'en': ['Namibia'],
  },
  'Lesotho': {
    'ja': ['レソト', 'れそと'],
    'en': ['Lesotho'],
  },
  'Kingdom of eSwatini': {
    'ja': ['エスワティニ', 'えすわてぃに', 'スワジランド'],
    'en': ['eSwatini', 'Swaziland', 'Kingdom of eSwatini'],
  },
  'Angola': {
    'ja': ['アンゴラ', 'あんごら'],
    'en': ['Angola'],
  },
  'Madagascar': {
    'ja': ['マダガスカル', 'まだがすかる'],
    'en': ['Madagascar'],
  },
  'Mauritius': {
    'ja': ['モーリシャス', 'もーりしゃす'],
    'en': ['Mauritius'],
  },
  'Seychelles': {
    'ja': ['セーシェル', 'せーしぇる'],
    'en': ['Seychelles'],
  },
  'Comoros': {
    'ja': ['コモロ', 'こもろ'],
    'en': ['Comoros'],
  },

  // === 北米 ===
  'United States of America': {
    'ja': [
      'アメリカ',
      'あめりか',
      'アメリカ合衆国',
      'あめりかがっしゅうこく',
      '米国',
      'べいこく',
      'USA',
      'ゆーえすえー',
    ],
    'en': ['United States of America', 'United States', 'USA', 'US', 'America'],
  },
  'Canada': {
    'ja': ['カナダ', 'かなだ'],
    'en': ['Canada'],
  },
  'Mexico': {
    'ja': ['メキシコ', 'めきしこ'],
    'en': ['Mexico'],
  },
  'Greenland': {
    'ja': ['グリーンランド', 'ぐりーんらんど'],
    'en': ['Greenland'],
  },

  // === 中米 ===
  'Guatemala': {
    'ja': ['グアテマラ', 'ぐあてまら'],
    'en': ['Guatemala'],
  },
  'Belize': {
    'ja': ['ベリーズ', 'べりーず'],
    'en': ['Belize'],
  },
  'El Salvador': {
    'ja': ['エルサルバドル', 'えるさるばどる'],
    'en': ['El Salvador'],
  },
  'Honduras': {
    'ja': ['ホンジュラス', 'ほんじゅらす'],
    'en': ['Honduras'],
  },
  'Nicaragua': {
    'ja': ['ニカラグア', 'にからぐあ'],
    'en': ['Nicaragua'],
  },
  'Costa Rica': {
    'ja': ['コスタリカ', 'こすたりか'],
    'en': ['Costa Rica'],
  },
  'Panama': {
    'ja': ['パナマ', 'ぱなま'],
    'en': ['Panama'],
  },

  // === カリブ海 ===
  'Cuba': {
    'ja': ['キューバ', 'きゅーば'],
    'en': ['Cuba'],
  },
  'Jamaica': {
    'ja': ['ジャマイカ', 'じゃまいか'],
    'en': ['Jamaica'],
  },
  'Haiti': {
    'ja': ['ハイチ', 'はいち'],
    'en': ['Haiti'],
  },
  'Dominican Republic': {
    'ja': ['ドミニカ共和国', 'どみにかきょうわこく'],
    'en': ['Dominican Republic', 'Dominican Rep.'],
  },
  'Puerto Rico': {
    'ja': ['プエルトリコ', 'ぷえるとりこ'],
    'en': ['Puerto Rico'],
  },
  'Bahamas': {
    'ja': ['バハマ', 'ばはま'],
    'en': ['Bahamas'],
  },
  'Trinidad and Tobago': {
    'ja': ['トリニダード・トバゴ', 'とりにだーどとばご'],
    'en': ['Trinidad and Tobago'],
  },
  'Barbados': {
    'ja': ['バルバドス', 'ばるばどす'],
    'en': ['Barbados'],
  },
  'Saint Lucia': {
    'ja': ['セントルシア', 'せんとるしあ'],
    'en': ['Saint Lucia'],
  },
  'Grenada': {
    'ja': ['グレナダ', 'ぐれなだ'],
    'en': ['Grenada'],
  },
  'Saint Vincent and the Grenadines': {
    'ja': ['セントビンセントおよびグレナディーン諸島', 'せんとびんせんとおよびぐれなでぃーんしょとう', 'セントビンセント'],
    'en': [
      'Saint Vincent and the Grenadines',
      'St. Vin. and Gren.',
      'St Vincent',
    ],
  },
  'Antigua and Barbuda': {
    'ja': ['アンティグア・バーブーダ', 'あんてぃぐあばーぶーだ'],
    'en': ['Antigua and Barbuda', 'Antigua and Barb.'],
  },
  'Dominica': {
    'ja': ['ドミニカ国', 'どみにかこく', 'ドミニカ'],
    'en': ['Dominica'],
  },
  'Saint Kitts and Nevis': {
    'ja': ['セントクリストファー・ネイビス', 'せんとくりすとふぁーねいびす', 'セントキッツ・ネイビス'],
    'en': ['Saint Kitts and Nevis', 'St. Kitts and Nevis'],
  },

  // === 南米 ===
  'Brazil': {
    'ja': ['ブラジル', 'ぶらじる'],
    'en': ['Brazil', 'Brasil'],
  },
  'Argentina': {
    'ja': ['アルゼンチン', 'あるぜんちん'],
    'en': ['Argentina'],
  },
  'Chile': {
    'ja': ['チリ', 'ちり'],
    'en': ['Chile'],
  },
  'Peru': {
    'ja': ['ペルー', 'ぺるー'],
    'en': ['Peru'],
  },
  'Colombia': {
    'ja': ['コロンビア', 'ころんびあ'],
    'en': ['Colombia'],
  },
  'Venezuela': {
    'ja': ['ベネズエラ', 'べねずえら'],
    'en': ['Venezuela'],
  },
  'Ecuador': {
    'ja': ['エクアドル', 'えくあどる'],
    'en': ['Ecuador'],
  },
  'Bolivia': {
    'ja': ['ボリビア', 'ぼりびあ'],
    'en': ['Bolivia'],
  },
  'Paraguay': {
    'ja': ['パラグアイ', 'ぱらぐあい'],
    'en': ['Paraguay'],
  },
  'Uruguay': {
    'ja': ['ウルグアイ', 'うるぐあい'],
    'en': ['Uruguay'],
  },
  'Guyana': {
    'ja': ['ガイアナ', 'がいあな'],
    'en': ['Guyana'],
  },
  'Suriname': {
    'ja': ['スリナム', 'すりなむ'],
    'en': ['Suriname'],
  },

  // === オセアニア ===
  'Australia': {
    'ja': ['オーストラリア', 'おーすとらりあ', '豪州', 'ごうしゅう'],
    'en': ['Australia', 'Oz'],
  },
  'New Zealand': {
    'ja': ['ニュージーランド', 'にゅーじーらんど', 'NZ'],
    'en': ['New Zealand', 'NZ'],
  },
  'Papua New Guinea': {
    'ja': ['パプアニューギニア', 'ぱぷあにゅーぎにあ', 'PNG'],
    'en': ['Papua New Guinea', 'PNG'],
  },
  'Fiji': {
    'ja': ['フィジー', 'ふぃじー'],
    'en': ['Fiji'],
  },
  'Solomon Islands': {
    'ja': ['ソロモン諸島', 'そろもんしょとう'],
    'en': ['Solomon Islands', 'Solomon Is.'],
  },
  'Vanuatu': {
    'ja': ['バヌアツ', 'ばぬあつ'],
    'en': ['Vanuatu'],
  },
  'Samoa': {
    'ja': ['サモア', 'さもあ'],
    'en': ['Samoa'],
  },
  'Tonga': {
    'ja': ['トンガ', 'とんが'],
    'en': ['Tonga'],
  },
  'Kiribati': {
    'ja': ['キリバス', 'きりばす'],
    'en': ['Kiribati'],
  },
  'Micronesia': {
    'ja': ['ミクロネシア', 'みくろねしあ'],
    'en': ['Micronesia', 'Federated States of Micronesia'],
  },
  'Marshall Islands': {
    'ja': ['マーシャル諸島', 'まーしゃるしょとう'],
    'en': ['Marshall Islands', 'Marshall Is.'],
  },
  'Palau': {
    'ja': ['パラオ', 'ぱらお'],
    'en': ['Palau'],
  },
  'Nauru': {
    'ja': ['ナウル', 'なうる'],
    'en': ['Nauru'],
  },
  'Tuvalu': {
    'ja': ['ツバル', 'つばる'],
    'en': ['Tuvalu'],
  },
  'New Caledonia': {
    'ja': ['ニューカレドニア', 'にゅーかれどにあ'],
    'en': ['New Caledonia'],
  },
  'French Polynesia': {
    'ja': ['フランス領ポリネシア', 'ふらんすりょうぽりねしあ', 'タヒチ'],
    'en': ['French Polynesia', 'Fr. Polynesia', 'Tahiti'],
  },
  'Guam': {
    'ja': ['グアム', 'ぐあむ'],
    'en': ['Guam'],
  },
  'Northern Mariana Islands': {
    'ja': ['北マリアナ諸島', 'きたまりあなしょとう'],
    'en': ['Northern Mariana Islands', 'N. Mariana Is.'],
  },
  'American Samoa': {
    'ja': ['アメリカ領サモア', 'あめりかりょうさもあ'],
    'en': ['American Samoa'],
  },
  'Cook Islands': {
    'ja': ['クック諸島', 'くっくしょとう'],
    'en': ['Cook Islands', 'Cook Is.'],
  },
  'Niue': {
    'ja': ['ニウエ', 'にうえ'],
    'en': ['Niue'],
  },

  // === カリブ海の小さな島々・海外領土 ===
  'Aruba': {
    'ja': ['アルバ', 'あるば'],
    'en': ['Aruba'],
  },
  'Curaçao': {
    'ja': ['キュラソー', 'きゅらそー'],
    'en': ['Curaçao', 'Curacao'],
  },
  'Sint Maarten': {
    'ja': ['シント・マールテン', 'しんとまーるてん'],
    'en': ['Sint Maarten'],
  },
  'Saint-Martin': {
    'ja': ['サン・マルタン', 'さんまるたん', 'セント・マーチン'],
    'en': ['Saint-Martin', 'St-Martin'],
  },
  'Saint-Barthélemy': {
    'ja': ['サン・バルテルミー', 'さんばるてるみー'],
    'en': ['Saint-Barthélemy', 'St-Barthélemy'],
  },
  'Anguilla': {
    'ja': ['アンギラ', 'あんぎら'],
    'en': ['Anguilla'],
  },
  'British Virgin Islands': {
    'ja': ['イギリス領ヴァージン諸島', 'いぎりすりょうう゛ぁーじんしょとう'],
    'en': ['British Virgin Islands', 'British Virgin Is.'],
  },
  'United States Virgin Islands': {
    'ja': ['アメリカ領ヴァージン諸島', 'あめりかりょうう゛ぁーじんしょとう'],
    'en': ['United States Virgin Islands', 'U.S. Virgin Is.'],
  },
  'Cayman Islands': {
    'ja': ['ケイマン諸島', 'けいまんしょとう'],
    'en': ['Cayman Islands', 'Cayman Is.'],
  },
  'Turks and Caicos Islands': {
    'ja': ['タークス・カイコス諸島', 'たーくすかいこすしょとう'],
    'en': ['Turks and Caicos Islands', 'Turks and Caicos Is.'],
  },
  'Montserrat': {
    'ja': ['モントセラト', 'もんとせらと'],
    'en': ['Montserrat'],
  },
  'Bermuda': {
    'ja': ['バミューダ', 'ばみゅーだ'],
    'en': ['Bermuda'],
  },
  'Saint Pierre and Miquelon': {
    'ja': ['サンピエール島・ミクロン島', 'さんぴえーるとうみくろんとう'],
    'en': ['Saint Pierre and Miquelon', 'St. Pierre and Miquelon'],
  },

  // === 大西洋・その他の島々 ===
  'Falkland Islands / Malvinas': {
    'ja': ['フォークランド諸島', 'ふぉーくらんどしょとう', 'マルビナス諸島'],
    'en': ['Falkland Islands', 'Falkland Is.', 'Malvinas'],
  },
  'Saint Helena': {
    'ja': ['セントヘレナ', 'せんとへれな'],
    'en': ['Saint Helena'],
  },
  'Faeroe Islands': {
    'ja': ['フェロー諸島', 'ふぇろーしょとう'],
    'en': ['Faeroe Islands', 'Faeroe Is.', 'Faroe Islands'],
  },
  'Åland Islands': {
    'ja': ['オーランド諸島', 'おーらんどしょとう'],
    'en': ['Åland Islands', 'Åland', 'Aland Islands'],
  },
  'Jersey': {
    'ja': ['ジャージー', 'じゃーじー'],
    'en': ['Jersey'],
  },
  'Guernsey': {
    'ja': ['ガーンジー', 'がーんじー'],
    'en': ['Guernsey'],
  },
  'Isle of Man': {
    'ja': ['マン島', 'まんとう'],
    'en': ['Isle of Man'],
  },
  'Gibraltar': {
    'ja': ['ジブラルタル', 'じぶらるたる'],
    'en': ['Gibraltar'],
  },

  // === インド洋・その他 ===
  'British Indian Ocean Territory': {
    'ja': ['イギリス領インド洋地域', 'いぎりすりょういんどようちいき'],
    'en': ['British Indian Ocean Territory', 'Br. Indian Ocean Ter.'],
  },
  'Réunion': {
    'ja': ['レユニオン', 'れゆにおん'],
    'en': ['Réunion', 'Reunion'],
  },
  'Mayotte': {
    'ja': ['マヨット', 'まよっと'],
    'en': ['Mayotte'],
  },

  // === 極地・南極 ===
  'Antarctica': {
    'ja': ['南極', 'なんきょく', '南極大陸'],
    'en': ['Antarctica'],
  },
  'French Southern and Antarctic Lands': {
    'ja': ['フランス領南方・南極地域', 'ふらんすりょうなんぽうなんきょくちいき'],
    'en': ['French Southern and Antarctic Lands', 'Fr. S. Antarctic Lands'],
  },
  'South Georgia and the Islands': {
    'ja': ['サウスジョージア・サウスサンドウィッチ諸島', 'さうすじょーじあさうすさんどうぃっちしょとう'],
    'en': ['South Georgia and the Islands', 'S. Geo. and the Is.'],
  },
  'Heard I. and McDonald Islands': {
    'ja': ['ハード島とマクドナルド諸島', 'はーどとうとまくどなるどしょとう'],
    'en': ['Heard I. and McDonald Islands'],
  },
  'Bouvet Island': {
    'ja': ['ブーベ島', 'ぶーべとう'],
    'en': ['Bouvet Island'],
  },

  // === その他の特別地域 ===
  'Western Sahara': {
    'ja': ['西サハラ', 'にしさはら'],
    'en': ['Western Sahara', 'W. Sahara'],
  },
  'Somaliland': {
    'ja': ['ソマリランド', 'そまりらんど'],
    'en': ['Somaliland'],
  },
  'Northern Cyprus': {
    'ja': ['北キプロス', 'きたきぷろす'],
    'en': ['Northern Cyprus', 'N. Cyprus'],
  },
  'Siachen Glacier': {
    'ja': ['シアチェン氷河', 'しあちぇんひょうが'],
    'en': ['Siachen Glacier'],
  },
  'Ashmore and Cartier Islands': {
    'ja': ['アシュモア・カルティエ諸島', 'あしゅもあかるてぃえしょとう'],
    'en': ['Ashmore and Cartier Islands', 'Ashmore and Cartier Is.'],
  },
  'Indian Ocean Territories': {
    'ja': ['インド洋地域', 'いんどようちいき'],
    'en': ['Indian Ocean Territories', 'Indian Ocean Ter.'],
  },
  'Norfolk Island': {
    'ja': ['ノーフォーク島', 'のーふぉーくとう'],
    'en': ['Norfolk Island'],
  },
  'Pitcairn Islands': {
    'ja': ['ピトケアン諸島', 'ぴとけあんしょとう'],
    'en': ['Pitcairn Islands', 'Pitcairn Is.'],
  },
  'Wallis and Futuna Islands': {
    'ja': ['ウォリス・フツナ', 'うぉりすふつな'],
    'en': ['Wallis and Futuna Islands', 'Wallis and Futuna Is.'],
  },
  'Tokelau': {
    'ja': ['トケラウ', 'とけらう'],
    'en': ['Tokelau'],
  },
};
