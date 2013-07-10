# Mojinizer

A gem for converting between hiragana, katakana, and romaji.

This gem:

* does _NOT_ convert kanji characters
* adds Japanese kana detection and conversion methods to the String class
* uses [moji](https://github.com/gimite/moji) to detect and convert kana strings (i.e., hiragana, katakana)
* uses code from [romajinizer](https://github.com/joeellis/romajinizer) to convert kana to romaji and vice versa



## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'mojinizer'
```

And then execute:

```term
$ bundle
```

Or install it yourself as:

```term
$ gem install mojinizer
```

## Usage

Japanese string conversion and detection methods are added to the `String` class. Call these like you would call any `String` object's methods. And you can chain them too.

### Conversion Methods

* Hiragana/katakana --> romaji conversion (平仮名/片仮名 --> ロ－マ字 変換)

```ruby
"つくえ".romaji #=> "tsukue"
"ツクエ".romaji #=> "tsukue"
```

* Katakana/romaji　--> hiragana conversion (片仮名/ロ－マ字 --> 平仮名 変換)

```ruby
"ツクエ".hiragana #=> "つくえ"
"tsukue".hiragana #=> "つくえ"
```

* Hiragana/romaji --> katakana conversion (平仮名/ロ－マ字 --> 片仮名 変換)

```ruby
"つくえ".katakana #=> "ツクエ"
"tsukue".katakana #=> "ツクエ"
```

* Hiragana --> katakana conversion (平仮名 --> 片仮名 変換)
* Katakana --> hiragana conversion (片仮名 --> 平仮名 変換)

```ruby
"つくえ".hira_to_kata #=> "ツクエ"
"ツクエ".kata_to_hira #=> "つくえ"
```

* Hankaku --> zenkaku conversion (半角 --> 全角 文字種変換)
* Zenkaku --> hankaku conversion (全角 --> 半角 文字種変換)
* Zenkaku <--> hankaku normalization (全角 <--> 半角 文字規準化)

```ruby
"ｱﾛﾊ".han_to_zen #=> "アロハ"
"Aloha!".han_to_zen #=> "Ａｌｏｈａ！"
"アロハ".zen_to_han #=> "ｱﾛﾊ"
"Ａｌｏｈａ！".zen_to_han #=> "Aloha!"
"ｱﾛﾊ！".normalize_zen_han #=> "アロハ!"
"｢Ａｌｏｈａ｣".normalize_zen_han #=> "「Aloha」"
```

* Chaining conversion methods

```ruby
"tsukue".katakana.zen_to_han #=> "ﾂｸｴ"
"ﾂｸｴ".han_to_zen.hiragana #=> "つくえ"
"ﾂｸｴ".han_to_zen.romaji #=> "tsukue"
"ﾂｸｴ".han_to_zen.romaji.upcase #=> "TSUKUE"
"ﾂｸｴ".han_to_zen.romaji.upcase.han_to_zen #=> "ＴＳＵＫＵＥ"
```


### Detection Methods

Used to detect Japanese character types (i.e., hiragana, katakana, kanji, full/half-width etc.). There are two groups of detection methods: methods that check the entire string, and methods that checks if the string contains character(s) of a specified character type.

If you need to detect other types of Japanese characters such as symbols or just need more flexibility, we expose the `moji` gem's `type?` method.

#### Check the entire string

* Is the entire string kana(hiragana/katakana)? (かな/カナ・文字種判定)

```ruby
"アロハ".kana? #=> true
"すし".kana? #=> true
"Aloha".kana? #=> false
"Let's eat すし".kana? #=> false
```

* Is the entire string hiragana? (平仮名・文字種判定)
* Is the entire string katakana? (片仮名・文字種判定)

```ruby
"アロハ".katakana? #=> true
"すし".katakana? #=> false
"アロハ everybody".katakana? #=> false
"アロハ".hiragana? #=> false
"すし".hiragana? #=> true
"Let's eat すし".hiragana? #=> false
```

* Is the entire string kanji? (漢字・文字種判定)

```ruby
"金曜日".kanji? #=> true
"金曜日だよ".kanji? #=> false
"It's Friday, 金曜日".kanji? #=> false
```

* Is the entire string hankaku? (半角・文字種判定)
* Is the entire string zenkaku? (全角・文字種判定)
* Is the entire string ASCII zenkaku? (ASCII全角・文字種判定)

```ruby
"ｱﾛﾊ".hankaku? #=> true
"アロハ".hankaku? #=> false
"ｱﾛﾊ".zenkaku? #=> false
"アロハ　ｅｖｅｒｙｂｏｄｙ".zenkaku? #=> true
"アロハ　ｅｖｅｒｙｂｏｄｙ".ascii_zenkaku? #=> false
"Ａｌｏｈａ".ascii_zenkaku? #=> true
```

* Is the entire string Japanese? (日本語・文字種判定)

```ruby
"アロハ".japanese? #=> true
"Let's eat すし".japanese? #=> false
```

#### Check if the string contains

* Does the string contain kana(hiragana/katakana)? (かな/カナ・文字種判定)

```ruby
"Let's eat すし".contains_kana? #=> true
```

* Does the string contain hiragana? (平仮名・文字種判定)
* Does the string contain katakana? (片仮名・文字種判定)

```ruby
"アロハ everybody".contains_katakana? #=> true
"Let's eat すし".contains_katakana? #=> false
"アロハ everybody".contains_hiragana? #=> false
"Let's eat すし".contains_hiragana? #=> true
```

* Does the string contain kanji? (漢字・文字種判定)

```ruby
"金曜日だよ".contains_kanji? #=> true
"It's Friday, Friday".contains_kanji? #=> false
```

* Does the string contain hankaku? (半角・文字種判定)
* Does the string contain zenkaku? (全角・文字種判定)
* Does the string contain ASCII zenkaku? (ASCII全角・文字種判定)

```ruby
"ｱﾛﾊ everybody".contains_hankaku? #=> true
"Let's eat すし".contains_hankaku? #=> false
"ｱﾛﾊ everybody".contains_zenkaku? #=> false
"Let's eat すし".contains_zenkaku? #=> true
"アロハ everybody".contains_ascii_zenkaku? #=> false
"Let's eat ｓｕｓｈｉ".contains_ascii_zenkaku? #=> true
```

* Does the string contain Japanese? (日本語・文字種判定)

```ruby
"Let's eat すし".contains_japanese? #=> true
"It's Friday, Friday".contains_japanese? #=> false
```

### MOAR detection with `moji_type?` and `contains_moji_type?`

The `moji` gem provides a customizable detection method. Mojinizer exposes this method as `moji_type?` and `contains_moji_type?`, the former checks the entire string and the latter  checks if the string contains a character of the requested type. Combine types using the pipe character.

```ruby
"アロハー!".moji_type?(Moji::KATA) #=> false
"アロハー!".moji_type?(Moji::KATA | Moji::SYMBOL) #=> true
"アロハー!".contains_moji_type?(Moji::ZEN_SYMBOL) #=> true
"アロハー!".contains_moji_type?(Moji::HIRA) #=> false
```

Here are the types that can be used or combined (copied from the `moji` gem's source code).

```
==定数:

以下の定数は、文字種の一番細かい分類です。
(({Moji.type})) が返すのは、以下の定数のうちの1つです。

--- HAN_CONTROL
    制御文字。
--- HAN_ASYMBOL
    ASCIIに含まれる半角記号。
--- HAN_JSYMBOL
    JISに含まれるがASCIIには含まれない半角記号。
--- HAN_NUMBER
    半角数字。
--- HAN_UPPER
    半角アルファベット大文字。
--- HAN_LOWER
    半角アルファベット小文字。
--- HAN_KATA
    半角カタカナ。
--- ZEN_ASYMBOL
    JISの全角記号のうち、ASCIIに対応する半角記号があるもの。
--- ZEN_JSYMBOL
    JISの全角記号のうち、ASCIIに対応する半角記号がないもの。
--- ZEN_NUMBER
    全角数字。
--- ZEN_UPPER
    全角アルファベット大文字。
--- ZEN_LOWER
    全角アルファベット小文字。
--- ZEN_HIRA
    ひらがな。
--- ZEN_KATA
    全角カタカナ。
--- ZEN_GREEK
    ギリシャ文字。
--- ZEN_CYRILLIC
    キリル文字。
--- ZEN_LINE
    罫線のかけら。
--- ZEN_KANJI
    漢字。

以下の定数は、上の文字種の組み合わせと別名です。

--- HAN_SYMBOL
    JISに含まれる半角記号。(({HAN_ASYMBOL | HAN_JSYMBOL}))
--- HAN_ALPHA
    半角アルファベット。(({HAN_UPPER | HAN_LOWER}))
--- HAN_ALNUM
    半角英数字。(({HAN_ALPHA | HAN_NUMBER}))
--- HAN
    全ての半角文字。(({HAN_CONTROL | HAN_SYMBOL | HAN_ALNUM | HAN_KATA}))
--- ZEN_SYMBOL
    JISに含まれる全角記号。(({ZEN_ASYMBOL | ZEN_JSYMBOL}))
--- ZEN_ALPHA
    全角アルファベット。(({ZEN_UPPER | ZEN_LOWER}))
--- ZEN_ALNUM
    全角英数字。(({ZEN_ALPHA | ZEN_NUMBER}))
--- ZEN_KANA
    全角かな/カナ。(({ZEN_KATA | ZEN_HIRA}))
--- ZEN
    JISに含まれる全ての全角文字。(({ZEN_SYMBOL | ZEN_ALNUM | ZEN_KANA | ZEN_GREEK | ZEN_CYRILLIC | ZEN_LINE | ZEN_KANJI}))
--- ASYMBOL
    ASCIIに含まれる半角記号とその全角版。(({HAN_ASYMBOL | ZEN_ASYMBOL}))
--- JSYMBOL
    JISに含まれるが (({ASYMBOL})) には含まれない全角/半角記号。(({HAN_JSYMBOL | ZEN_JSYMBOL}))
--- SYMBOL 
    JISに含まれる全ての全角/半角記号。(({HAN_SYMBOL | ZEN_SYMBOL}))
--- NUMBER
    全角/半角数字。(({HAN_NUMBER | ZEN_NUMBER}))
--- UPPER
    全角/半角アルファベット大文字。(({HAN_UPPER | ZEN_UPPER}))
--- LOWER
    全角/半角アルファベット小文字。(({HAN_LOWER | ZEN_LOWER}))
--- ALPHA
    全角/半角アルファベット。(({HAN_ALPHA | ZEN_ALPHA}))
--- ALNUM
    全角/半角英数字。(({HAN_ALNUM | ZEN_ALNUM}))
--- HIRA
    (({ZEN_HIRA})) の別名。
--- KATA
    全角/半角カタカナ。(({HAN_KATA | ZEN_KATA}))
--- KANA
    全角/半角 かな/カナ。(({KATA | ZEN_HIRA}))
--- GREEK
    (({ZEN_GREEK})) の別名。
--- CYRILLIC
    (({ZEN_CYRILLIC})) の別名。
--- LINE
    (({ZEN_LINE})) の別名。
--- KANJI
    (({ZEN_KANJI})) の別名。
--- ALL
    上記全ての文字。
```


## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Refer to [LICENSE.txt](LICENSE.txt) file for addtional information.



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
