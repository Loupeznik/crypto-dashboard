require "option_parser"

# Process command line input
# Moved to main module for now
class CLI
  # Set base values
  interval = 60
  coins = "btc"
  currency = "USD"

  # Parse options
  def parseOptions
    OptionParser.parse do |parser|
      parser.banner = "Usage: crdash --interval <interval> --coins=coin1,coin2 --currency <currency>"
      parser.on("-i seconds", "--interval seconds", "Sets the refresh interval") { |seconds| interval = seconds }
      parser.on("--coins=LIST", "Sets cryptocurrencies to be fetched") { |list| coin_list = list }
      parser.on("-c cur", "--currency cur", "Sets additional currency") { |cur| currency = cur }
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
  end
end
