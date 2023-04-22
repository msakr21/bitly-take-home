require 'csv'
require './lib/encode'

class ClickTracker
  attr_reader :encodes

  def initialize
    @encodes = []
  end

  def add_csv_encodes(file_path)
    CSV.foreach file_path, headers: true, header_converters: :symbol do |row|
      @encodes << Encode.new(row[:long_url], "http://#{row[:domain]}/#{row[:hash]}")
    end
  end
end

# file_path = './data/encodes.csv'


