require "./helpers/*"

module Crypto::Dashboard
  VERSION = "0.1.0"

  coins = ["btc"] of String

  coins.each do |coin|
    parser = Parser.new(coin)
    parser.parseData # debug - it works
  end
end
