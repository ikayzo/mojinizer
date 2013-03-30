#coding: utf-8
require 'spec_helper'

describe Ikayzo::MojiPlusRomajinizer do
  context "should convert" do
    it "romaji or katakana to hiragana properly" do
      "tsukue".hiragana.should == "つくえ"
      "kinnyoubi".hiragana.should == "きんようび"
      "kin'youbi".hiragana.should == "きんようび"
      "konnya".hiragana.should == "こんや"
      "konnnichi".hiragana.should == "こんにち"
      "kaetta".hiragana.should == "かえった"
      "ツクエ".hiragana.should == "つくえ"
      "こんばn".hiragana.should == "こんばん"
      "konnbann".hiragana.should == "こんばん"
      "".hiragana.should == ""
    end

    it "romaji or hiragana to katakana properly" do
      "tsukue".katakana.should == "ツクエ"
      "kinnyoubi".katakana.should == "キンヨウビ"
      "kin'youbi".katakana.should == "キンヨウビ"
      "konnya".katakana.should == "コンヤ"
      "konnnichi".katakana.should == "コンニチ"
      "kaetta".katakana.should == "カエッタ"
      "つくえ".katakana.should == "ツクエ"
      "行きます".katakana.should == "行キマス"
      "こんばn".katakana.should == "コンバン"
      "konnbann".katakana.should == "コンバン"
      "aloha元気？".katakana.should == "アロハ元気？"
      "アロハ、げんき？".katakana.should == "アロハ、ゲンキ？"
      "aloha　まはろ".katakana.should == "アロハ　マハロ"
      "".katakana.should == ""
    end

    it "kana to romaji properly" do
      "つくえ".romaji.should == "tsukue"
      "きんようび".romaji.should == "kinyoubi"
      "こんや".romaji.should == "konya"
      "こんにち".romaji.should == "konnichi"
      "ツクエ".romaji.should == "tsukue"
      "キンヨウビ".romaji.should == "kinyoubi"
      "コンヤ".romaji.should == "konya"
      "コンニチ".romaji.should == "konnichi"
      "today is きんようび".romaji.should == "today is kinyoubi"
      "today is キンヨウビ".romaji.should == "today is kinyoubi"
      "".romaji.should == ""
    end

    it "romaji or kana to hankaku properly" do
      "あろは".zen_to_han.should == "あろは"
      "アロハ！".zen_to_han.should == "ｱﾛﾊ!"
      "ａｌｏｈａ！".zen_to_han.should == "aloha!"
      "ＡＬＯＨＡ！".zen_to_han.should == "ALOHA!"
      "".zen_to_han.should == ""
    end

    it "romaji or kana to zenkaku properly" do
      "ｱﾛﾊ!".han_to_zen.should == "アロハ！"
      "あろは！".han_to_zen.should == "あろは！"
      "aloha!".han_to_zen.should == "ａｌｏｈａ！"
      "ALOHA!".han_to_zen.should == "ＡＬＯＨＡ！"
      "".han_to_zen.should == ""
    end
  end

  context "should be able to tell if a string contains" do
    it "kana" do
      "行きます".contains_kana?.should == true
      "abcdefg!".contains_kana?.should == false
      "アロハeverybody".contains_kana?.should == true
      "あろはeverybody".contains_kana?.should == true
      "ｱﾛﾊeverybody".contains_kana?.should == true
    end

    it "hiragana" do
      "行きます".contains_hiragana?.should == true
      "abcdefg!".contains_hiragana?.should == false
      "アロハeverybody".contains_hiragana?.should == false
      "あろはeverybody".contains_hiragana?.should == true
      "ｱﾛﾊeverybody".contains_hiragana?.should == false
    end

    it "katakana" do
      "行きます".contains_katakana?.should == false
      "abcdefg!".contains_katakana?.should == false
      "アロハeverybody".contains_katakana?.should == true
      "ｱﾛﾊeverybody".contains_katakana?.should == true
    end

    it "kanji" do
      "行きます".contains_kanji?.should == true
      "abcdefg!".contains_kanji?.should == false
      "アロハeverybody".contains_kanji?.should == false
      "ｱﾛﾊeverybody".contains_kanji?.should == false
    end

    it "hankaku" do
      "あ".contains_hankaku?.should == false
      "ア".contains_hankaku?.should == false
      "a".contains_hankaku?.should == false
      "Ａ".contains_hankaku?.should == false
      "ＡＬＯＨＡ".contains_hankaku?.should == false
      "アろは".contains_hankaku?.should == false
      "aloha".contains_hankaku?.should == false
      "aloは".contains_hankaku?.should == false
      "ｱ".contains_hankaku?.should == true
      "ｱﾛﾊ".contains_hankaku?.should == true
      "ｱﾛﾊeverybody".contains_hankaku?.should == true
    end

    it "zenkaku" do
      "あ".contains_zenkaku?.should == true
      "ア".contains_zenkaku?.should == true
      "a".contains_zenkaku?.should == false
      "Ａ".contains_zenkaku?.should == true
      "ＡＬＯＨＡ".contains_zenkaku?.should == true
      "アろは".contains_zenkaku?.should == true
      "aloha".contains_zenkaku?.should == false
      "aloは".contains_zenkaku?.should == true
      "ｱ".contains_zenkaku?.should == false
      "ｱﾛﾊ".contains_zenkaku?.should == false
      "ｱﾛﾊeverybody".contains_zenkaku?.should == false
    end

    it "Japanese characters" do
      "行きます".contains_japanese?.should == true
      "abcdefg!".contains_japanese?.should == false
      "アロハeverybody".contains_japanese?.should == true
      "everybody、行きます".contains_japanese?.should == true
      "aloha〜！".contains_japanese?.should == true
      "ｱﾛﾊeverybody".contains_japanese?.should == true
    end
  end

  context "should be able to tell if a character or the entire string is" do
    it "kana" do
      "す".kana?.should == true
      "すし".kana?.should == true
      "アロハ".kana?.should == true
      "行".kana?.should == false
      "sushi".kana?.should == false
      "アロハeverybody".kana?.should == false
    end

    it "hiragana" do
      "あ".hiragana?.should == true
      "ア".hiragana?.should == false
      "a".hiragana?.should == false
      "あろは".hiragana?.should == true
      "あロは".hiragana?.should == false
    end

    it "katakana" do
      "あ".katakana?.should == false
      "ア".katakana?.should == true
      "a".katakana?.should == false
      "アろは".katakana?.should == false
      "アロハ".katakana?.should == true
      "アロは".katakana?.should == false
    end

    it "kanji" do
      "行".kanji?.should == true
      "あ".kanji?.should == false
      "ア".kanji?.should == false
      "〜".kanji?.should == false
      "a".kanji?.should == false
      "アロハ".kanji?.should == false
      "ＡＬＯＨＡ".kanji?.should == false
      "金曜日".kanji?.should == true
      "金曜日だ〜".kanji?.should == false
      "金曜日FRIDAY".kanji?.should == false
    end

    it "hankaku" do
      "あ".hankaku?.should == false
      "ア".hankaku?.should == false
      "a".hankaku?.should == false
      "Ａ".hankaku?.should == false
      "ＡＬＯＨＡ".hankaku?.should == false
      "アろは".hankaku?.should == false
      "aloha".hankaku?.should == false
      "aloは".hankaku?.should == false
      "ｱ".hankaku?.should == true
      "ｱﾛﾊ".hankaku?.should == true
      "｡".hankaku?.should == true
    end

    it "zenkaku" do
      "あ".zenkaku?.should == true
      "ア".zenkaku?.should == true
      "a".zenkaku?.should == false
      "Ａ".zenkaku?.should == true
      "ＡＬＯＨＡ".zenkaku?.should == true
      "アろは".zenkaku?.should == true
      "アロハ".zenkaku?.should == true
      "aloha".zenkaku?.should == false
      "aloは".zenkaku?.should == false
      "ｱ".zenkaku?.should == false
      "ｱﾛﾊ".zenkaku?.should == false
    end

    it "Japanese characters" do
      "あ".japanese?.should == true
      "ア".japanese?.should == true
      "a".japanese?.should == false
      "アろは".japanese?.should == true
      "アロハ".japanese?.should == true
      "aloha".japanese?.should == false
      "aloは".japanese?.should == false
      "ｱ".japanese?.should == true
      "ｱﾛﾊ".japanese?.should == true
      "ｱﾛﾊeverybody".japanese?.should == false
    end
  end

end
