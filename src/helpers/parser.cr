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
        puts data
    end

end
