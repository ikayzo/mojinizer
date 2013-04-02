require "mojizilla/version"
require "mojizilla/romaji_tables"
require "mojizilla/conversion"
require "mojizilla/detection"
require "moji"

class String
  include Mojizilla
end