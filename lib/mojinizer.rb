require "mojinizer/version"
require "mojinizer/romaji_tables"
require "mojinizer/conversion"
require "mojinizer/detection"
require "moji"

class String
  include Mojinizer
end