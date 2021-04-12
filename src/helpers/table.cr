require "tallboy"

# Renders a table with parsed data for the CLI
class Table
  @values : Array(Array(JSON::Any))

  def initialize(@values)
  end

  property :values

  def normalize(value)
    return value.to_s.to_f.round(3)
  end

  def render
    table = Tallboy.table do
      header ["Crypto", "Price(USD)", "+-(1h)", "Low(1h)", "High(1h)", "+-(24h)", "Low(24h)", "High(24h)"]
      values.each do |value|
        row ["#{value[1]}|#{value[0]}", normalize(value[2]), normalize(value[3]), normalize(value[4]), normalize(value[5]), normalize(value[6]), normalize(value[7]), normalize(value[8])]
      end
    end
  end
end
