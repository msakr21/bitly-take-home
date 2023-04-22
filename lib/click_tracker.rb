require 'csv'
require 'json'
require './lib/encode'
require 'pry'

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

  def parse_decodes_json(file_path)
    JSON.parse(File.read(file_path))
  end

  #made the above two methods accept arguments to make updating file locations easier in case that's ever needed

  def count_clicks_by_year(year_string, file_path)
    decodes = parse_decodes_json(file_path)
    counter = Hash.new(0)
    decodes.each do |row|
      (counter[row["bitlink"]] += 1) if row["timestamp"][0..3] == year_string 
    end
    counter
  end

  
end