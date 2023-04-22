require 'csv'
require 'json'
require './lib/encode'

class ClickTracker
  attr_reader :encodes

  def initialize
    @encodes = []
  end

  def add_csv_encodes(csv_file_path)
    CSV.foreach csv_file_path, headers: true, header_converters: :symbol do |row|
      @encodes << Encode.new(row[:long_url], "http://#{row[:domain]}/#{row[:hash]}")
    end
  end

  def parse_decodes_json(json_file_path)
    JSON.parse(File.read(json_file_path))
  end

  #made the above two methods accept arguments to make updating file locations easier in case that's ever needed

  def count_clicks_by_year(year_string, json_file_path)
    decodes = parse_decodes_json(json_file_path)
    counter = Hash.new(0)
    decodes.each do |row|
      (counter[row["bitlink"]] += 1) if row["timestamp"][0..3] == year_string
    end
    counter
  end

  def click_count_by_long_link(year_string, json_file_path, csv_file_path)
    add_csv_encodes(csv_file_path)
    short_link_count = count_clicks_by_year(year_string, json_file_path)
    long_link_count = {}
    short_link_count.each do |short_link, count|
      @encodes.each do |encode| 
        (long_link_count[encode.long_link] = count) if short_link == encode.short_link
      end
    end
    long_link_count
  end
end