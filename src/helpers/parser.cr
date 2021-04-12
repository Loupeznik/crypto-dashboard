require "halite"
require "json"

# Parses data for given crypto
class Parser
  @coin : String

  def initialize(@coin)
  end

  property :coin

  # Fetch data from messario API
  def fetchData
    response = Halite.get("https://data.messari.io/api/v1/assets/#{@coin}/metrics")
    return response.parse("json")
  end

  # Parse data into an array for further processing
  def parseData
    data = fetchData
    values = [
      data["data"]["name"],                     # Crypto name
      data["data"]["symbol"],                   # Crypto symbol
      data["data"]["market_data"]["price_usd"], # Current price in USD
      data["data"]["market_data"]["percent_change_usd_last_1_hour"], # Price change in % in last hour
      data["data"]["market_data"]["ohlcv_last_1_hour"]["low"], # Lowest price in last hour
      data["data"]["market_data"]["ohlcv_last_1_hour"]["high"], # Highest price in last hour
      data["data"]["market_data"]["percent_change_usd_last_24_hours"], # Price change in % in last day
      data["data"]["market_data"]["ohlcv_last_24_hour"]["low"], # Lowest price in last day
      data["data"]["market_data"]["ohlcv_last_24_hour"]["high"], # Highest price in last day
    ]
    return values
  end
end
