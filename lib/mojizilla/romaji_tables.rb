# coding: utf-8
module Mojizilla

  Kana2romH={
    "ア"=>"a", "イ"=>"i", "ウ"=>"u", "エ"=>"e","オ"=>"o",
    "あ"=>"a", "い"=>"i", "う"=>"u", "え"=>"e","お"=>"o",
    "カ"=>"ka", "キ"=>"ki", "ク"=>"ku", "ケ"=>"ke", "コ"=>"ko",
    "か"=>"ka", "き"=>"ki", "く"=>"ku", "け"=>"ke", "こ"=>"ko",
    "ガ"=>"ga", "ギ"=>"gi", "グ"=>"gu", "ゲ"=>"ge", "ゴ"=>"go",
    "が"=>"ga", "ぎ"=>"gi", "ぐ"=>"gu", "げ"=>"ge", "ご"=>"go",
    "サ"=>"sa", "シ"=>"si", "ス"=>"su", "セ"=>"se", "ソ"=>"so",
    "さ"=>"sa", "し"=>"shi","す"=>"su", "せ"=>"se", "そ"=>"so",
    "ザ"=>"za", "ジ"=>"ji", "ズ"=>"zu", "ゼ"=>"ze", "ゾ"=>"zo",
    "ざ"=>"za", "じ"=>"ji", "ず"=>"zu", "ぜ"=>"ze", "ぞ"=>"zo",
    "タ"=>"ta", "チ"=>"chi","ツ"=>"tsu","テ"=>"te", "ト"=>"to",
    "た"=>"ta", "ち"=>"chi","つ"=>"tsu","て"=>"te", "と"=>"to",
    "ダ"=>"da", "ヂ"=>"dji","ヅ"=>"dzu","デ"=>"de", "ド"=>"do",
    "だ"=>"da", "ぢ"=>"dji","づ"=>"dzu","で"=>"de", "ど"=>"do",
    "ナ"=>"na", "ニ"=>"ni", "ヌ"=>"nu", "ネ"=>"ne", "ノ"=>"no",
    "な"=>"na", "に"=>"ni", "ぬ"=>"nu", "ね"=>"ne", "の"=>"no",
    "ハ"=>"ha", "ヒ"=>"hi", "フ"=>"fu", "ヘ"=>"he", "ホ"=>"ho",
    "は"=>"ha", "ひ"=>"hi", "ふ"=>"fu", "へ"=>"he", "ほ"=>"ho",
    "バ"=>"ba", "ビ"=>"bi", "ブ"=>"bu", "ベ"=>"be", "ボ"=>"bo",
    "ば"=>"ba", "び"=>"bi", "ぶ"=>"bu", "べ"=>"be", "ぼ"=>"bo",
    "パ"=>"pa", "ピ"=>"pi", "プ"=>"pu", "ペ"=>"pe", "ポ"=>"po",
    "ぱ"=>"pa", "ぴ"=>"pi", "ぷ"=>"pu", "ぺ"=>"pe", "ぽ"=>"po",
    "マ"=>"ma", "ミ"=>"mi", "ム"=>"mu", "メ"=>"me", "モ"=>"mo",
    "ま"=>"ma", "み"=>"mi", "む"=>"mu", "め"=>"me", "も"=>"mo",
    "ヤ"=>"ya", "ユ"=>"yu", "ヨ"=>"yo",
    "や"=>"ya", "ゆ"=>"yu", "よ"=>"yo",
    "ラ"=>"ra", "リ"=>"ri", "ル"=>"ru","レ"=>"re","ロ"=>"ro",
    "ら"=>"ra", "り"=>"ri", "る"=>"ru","れ"=>"re","ろ"=>"ro",
    "ワ"=>"wa", "ヰ"=>"wi", "ヱ"=>"we", "ヲ"=>"wo", "ン"=>"nn",
    "わ"=>"wa", "ゐ"=>"wi", "ゑ"=>"we", "を"=>"wo", "ん"=>"nn",
    "ァ"=>"xa", "ィ"=>"xi", "ゥ"=>"xu", "ェ"=>"xe", "ォ"=>"xo",
    "ぁ"=>"xa", "ぃ"=>"xi", "ぅ"=>"xu", "ぇ"=>"xe", "ぉ"=>"xo",
    "ッ"=>"xtsu","ャ"=>"xya", "ュ"=>"xyu", "ョ"=>"xyo",
    "っ"=>"xtsu","ゃ"=>"xya", "ゅ"=>"xyu", "ょ"=>"xyo",
    "ヴ"=>"vu", "ヵ"=>"xka","ヶ"=>"ga","ヮ"=>"xwa",
    "ゎ"=>"xwa",
    "ー"=>"-", "−"=>"-", "゛"=>'"', "゜"=>"'", "、"=>",", "。"=>".",
    "："=>":", "　" => " ", "＠" => "@", "（" => "(", "）" => ")",
    " " => " "
  }

  Kana2romH2={
    "てぃ" => "ti", "でぃ" => "di"
  }
  # 1 character romaji patterns
  Rom2KataH1={
    "a"=>"ア", "i"=>"イ", "u"=>"ウ", "e"=>"エ", "o"=>"オ", "-"=>"ー"
  }

  # 2 character romaji patterns
  Rom2KataH2={
    "xa"=>"ァ", "xi"=>"ィ", "xu"=>"ゥ", "xe"=>"ェ", "xo"=>"ォ",
    "ka"=>"カ", "ki"=>"キ", "ku"=>"ク", "ke"=>"ケ", "ko"=>"コ",
    "ca"=>"カ", "cu"=>"ク", "co"=>"コ",
    "ga"=>"ガ", "gi"=>"ギ", "gu"=>"グ", "ge"=>"ゲ", "go"=>"ゴ",
    "sa"=>"サ", "si"=>"シ", "su"=>"ス", "se"=>"セ", "so"=>"ソ",
    "za"=>"ザ", "zi"=>"ジ", "zu"=>"ズ", "ze"=>"ゼ", "zo"=>"ゾ",
    "ja"=>"ジャ","ji"=>"ジ", "ju"=>"ジュ","je"=>"ジェ","jo"=>"ジョ",
    "ta"=>"タ", "ti"=>"チ", "tsu"=>"ツ", "te"=>"テ", "to"=>"ト",
    "da"=>"ダ", "di"=>"ヂ", "du"=>"ヅ", "de"=>"デ", "do"=>"ド",
    "na"=>"ナ", "ni"=>"ニ", "nu"=>"ヌ", "ne"=>"ネ", "no"=>"ノ",
    "ha"=>"ハ", "hi"=>"ヒ", "hu"=>"フ", "he"=>"ヘ", "ho"=>"ホ",
    "ba"=>"バ", "bi"=>"ビ", "bu"=>"ブ", "be"=>"ベ", "bo"=>"ボ",
    "pa"=>"パ", "pi"=>"ピ", "pu"=>"プ", "pe"=>"ペ", "po"=>"ポ",
    "va"=>"ヴァ","vi"=>"ヴィ","vu"=>"ヴ", "ve"=>"ヴェ","vo"=>"ヴォ",
    "fa"=>"ファ","fi"=>"フィ","fu"=>"フ", "fe"=>"フェ","fo"=>"フォ",
    "ma"=>"マ", "mi"=>"ミ", "mu"=>"ム", "me"=>"メ", "mo"=>"モ",
    "ya"=>"ヤ", "yi"=>"イ", "yu"=>"ユ", "ye"=>"イェ", "yo"=>"ヨ",
    "ra"=>"ラ", "ri"=>"リ", "ru"=>"ル", "re"=>"レ", "ro"=>"ロ",
    "la"=>"ラ", "li"=>"リ", "lu"=>"ル", "le"=>"レ", "lo"=>"ロ",
    "wa"=>"ワ", "wi"=>"ヰ", "wu"=>"ウ", "we"=>"ヱ", "wo"=>"ヲ",
    "nn"=>"ン"
  }

  # 3 character romaji patterns
  Rom2KataH3={
    "tsu"=>"ツ",
    "xka"=>"ヵ", "xke"=>"ヶ",
    "xwa"=>"ヮ", "xtsu"=>"ッ",   "xya"=>"ャ",  "xyu"=>"ュ",  "xyo"=>"ョ",
    "kya"=>"キャ", "kyi"=>"キィ", "kyu"=>"キュ", "kye"=>"キェ", "kyo"=>"キョ",
    "gya"=>"ギャ", "gyi"=>"ギィ", "gyu"=>"ギュ", "gye"=>"ギェ", "gyo"=>"ギョ",
    "sya"=>"シャ", "syi"=>"シィ", "syu"=>"シュ", "sye"=>"シェ", "syo"=>"ショ",
    "sha"=>"シャ", "shi"=>"シ",  "shu"=>"シュ", "she"=>"シェ", "sho"=>"ショ",
    "zya"=>"ジャ", "zyi"=>"ジィ", "zyu"=>"ジュ", "zye"=>"ジェ", "zyo"=>"ジョ",
    "jya"=>"ジャ", "jyi"=>"ジィ", "jyu"=>"ジュ", "jye"=>"ジェ", "jyo"=>"ジョ",
    "tya"=>"チャ", "tyi"=>"チィ", "tyu"=>"チュ", "tye"=>"チェ", "tyo"=>"チョ",
    "cya"=>"チャ", "cyi"=>"チィ", "cyu"=>"チュ", "cye"=>"チェ", "cyo"=>"チョ",
    "cha"=>"チャ", "chi"=>"チ",  "chu"=>"チュ", "che"=>"チェ", "cho"=>"チョ",
    "tha"=>"テャ", "thi"=>"ティ", "thu"=>"テュ", "the"=>"テェ", "tho"=>"テョ",
    "dya"=>"ヂャ", "dyi"=>"ヂィ", "dyu"=>"ヂュ", "dye"=>"ヂェ", "dyo"=>"ヂョ",
    "dha"=>"デャ", "dhi"=>"ディ", "dhu"=>"デュ", "dhe"=>"デェ", "dho"=>"デョ",
    "nya"=>"ニャ", "nyi"=>"ニィ", "nyu"=>"ニュ", "nye"=>"ニェ", "nyo"=>"ニョ",
    "hya"=>"ヒャ", "hyi"=>"ヒィ", "hyu"=>"ヒュ", "hye"=>"ヒェ", "hyo"=>"ヒョ",
    "bya"=>"ビャ", "byi"=>"ビィ", "byu"=>"ビュ", "bye"=>"ビェ", "byo"=>"ビョ",
    "pya"=>"ピャ", "pyi"=>"ピィ", "pyu"=>"ピュ", "pye"=>"ピェ", "pyo"=>"ピョ",
    "mya"=>"ミャ", "myi"=>"ミィ", "myu"=>"ミュ", "mye"=>"ミェ", "myo"=>"ミョ",
    "rya"=>"リャ", "ryi"=>"リィ", "ryu"=>"リュ", "rye"=>"リェ", "ryo"=>"リョ",
    "lya"=>"リャ", "lyi"=>"リィ", "lyu"=>"リュ", "lye"=>"リェ", "lyo"=>"リョ"
  }

end