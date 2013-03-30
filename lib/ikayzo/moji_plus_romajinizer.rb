require "ikayzo/moji_plus_romajinizer/version"
require "ikayzo/moji_plus_romajinizer/romaji_tables"
require "ikayzo/moji_plus_romajinizer/conversion"
require "ikayzo/moji_plus_romajinizer/detection"
require "moji"

class String
  include Ikayzo::MojiPlusRomajinizer
end