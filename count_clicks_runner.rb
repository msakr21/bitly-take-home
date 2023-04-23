require './lib/click_tracker'

puts JSON.pretty_generate(ClickTracker.new.sorted_count("2021", './data/decodes.json', './data/encodes.csv'))