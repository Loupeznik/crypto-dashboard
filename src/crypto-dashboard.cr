require "./helpers/*"
require "option_parser"
require "schedule"

module Crypto::Dashboard
  VERSION = "0.9.0"

  # Define base variables
  coins = [] of String
  values = [] of Array(JSON::Any)
  coin_list = "btc"
  interval = 0
  # currency = "USD"

  # CLI
  OptionParser.parse do |parser|
    parser.banner = "Usage: crdash --interval <interval> --coins=coin1,coin2"
    parser.on("-i seconds", "--interval seconds", "Sets the refresh interval (0 for no refresh)") { |seconds| interval = seconds }
    parser.on("--coins=LIST", "Sets cryptocurrencies to be fetched (default: BTC)") { |list| coin_list = list }
    # parser.on("-c cur", "--currency cur", "Sets the currency") { |cur| currency = cur }
    parser.on("-h", "--help", "Show this help") do
      puts parser
      exit
    end
    parser.invalid_option do |flag|
      STDERR.puts "ERROR: #{flag} is not a valid option."
      STDERR.puts parser
      exit(1)
    end
  end

  # Convert parsed values to desired types
  coins = coin_list.split(",")
  time = interval.to_i32

  # Main program
  coins.each do |coin|
    parser = Parser.new(coin)
    values.push(parser.parseData)
  end

  puts "Welcome to Crypto Dashboard"
  if time > 0
    puts "Your dashboard will reset every #{interval} seconds"
  end
  puts "You may terminate the program at any time with CTRL+C"
  puts "Created by Dominik Zarsky (https://github.com/Loupeznik)"
  puts "--------------------------------------------------------"

  table = Table.new(values)
  puts table.render

  if time > 0
    values.clear
    Schedule.every(time.seconds) do
      puts "Dashboard refreshed - #{Time.local.to_s}"
      coins.each do |coin|
        parser = Parser.new(coin)
        values.push(parser.parseData)
      end

      table = Table.new(values)
      puts table.render
      values.clear
    end
    sleep
  end
end
