# coding: utf-8
module Mojinizer
  def hiragana?
    moji_type?(Moji::HIRA)
  end

  def katakana?
    moji_type?(Moji::KATA)
  end

  def kana?
    return (hiragana? || katakana?)
  end

  def kanji?
    moji_type?(Moji::KANJI)
  end

  def hankaku?
    moji_type?(Moji::HAN_KATA | Moji::HAN_JSYMBOL)
  end

  def zenkaku?
    moji_type?(Moji::ZEN)
  end

  def japanese?
    moji_type?(Moji::ZEN | Moji::JSYMBOL | Moji::HAN_KATA)
  end

  def moji_type?(type)
    chars = []
    self.each_char { |c| chars << c if Moji.type?(c, type) }
    (chars.count == self.length) ? true : false
  end

  def contains_hiragana?
    contains_moji_type?(Moji::HIRA)
  end

  def contains_kana?
    contains_moji_type?(Moji::KANA)
  end

  def contains_katakana?
    contains_moji_type?(Moji::KATA)
  end

  def contains_kanji?
    contains_moji_type?(Moji::KANJI)
  end

  def contains_hankaku?
    contains_moji_type?(Moji::HAN_KATA | Moji::HAN_JSYMBOL)
  end

  def contains_zenkaku?
    contains_moji_type?(Moji::ZEN)
  end

  def contains_japanese?
    contains_moji_type?(Moji::ZEN | Moji::JSYMBOL | Moji::HAN_KATA)
  end

  def contains_moji_type?(type)
    self.each_char { |c| return true if Moji.type?(c, type) }
    return false
  end
end