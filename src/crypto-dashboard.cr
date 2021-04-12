require "./helpers/*"

module Crypto::Dashboard
  VERSION = "0.1.0"

  coins = ["btc", "eth"] of String
  values = [] of Array(JSON::Any)

  coins.each do |coin|
    parser = Parser.new(coin)
    values.push(parser.parseData)
  end

  table = Table.new(values)
  puts table.render
  
end
