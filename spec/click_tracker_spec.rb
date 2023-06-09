require 'spec_helper'

RSpec.describe ClickTracker do
  let(:click_tracker) {ClickTracker.new}

  it "exists" do
    expect(click_tracker).to be_a(ClickTracker)
  end

  it "has a readable array attribute 'encodes' that is empty by default" do
    expect(click_tracker.encodes).to eq([])
  end

  describe '#add_encodes' do
    it "adds new encodes to the click tracker encodes array" do
      click_tracker.add_csv_encodes('./data/encodes.csv')

      expect(click_tracker.encodes.length).to eq(6)
      expect(click_tracker.encodes[0].long_link).to eq("https://google.com/")
      expect(click_tracker.encodes[0].short_link).to eq("http://bit.ly/31Tt55y")
      expect(click_tracker.encodes[5].long_link).to eq("https://youtube.com/")
      expect(click_tracker.encodes[5].short_link).to eq("http://bit.ly/2lNPjVU")
    end
  end

  describe '#count_clicks_by_year' do
    it "counts the clicks(elements from the parsed json array) based on the year provided" do
      short_link_count = click_tracker.count_clicks_by_year("2021", './spec/mock_data/mock_decodes.json')

      expect(short_link_count).to be_a(Hash)
      expect(short_link_count).to eq({"http://es.pn/3MgVNnZ"=>2, 
                                "http://bit.ly/2kjqil6"=>2, 
                                "http://bit.ly/2kkAHNs"=>1, 
                                "http://bit.ly/2kJdsg8"=>2, 
                                "http://bit.ly/2lNPjVU"=>1, 
                                "http://bit.ly/2kJO0qS"=>1, 
                                "http://bit.ly/2kJej0k"=>1
                                })
    end
  end

  describe '#click_count_by_long_link' do
    it "counts the clicks for a given year and displays them according to their long link if encode is provided" do
      long_link_count = click_tracker.click_count_by_long_link("2021", './spec/mock_data/mock_decodes.json', './data/encodes.csv')

      expect(long_link_count).to be_an(Array)
      expect(long_link_count).to include({"https://reddit.com/"=>2}, 
                                         {"https://youtube.com/"=>1}, 
                                         {"https://github.com/"=>1}, 
                                         {"https://linkedin.com/"=>1},
                                         {"https://twitter.com/"=>1})
    end
  end

  describe '#sorted_count' do
    it "returns a list of click counts that is sorted by count" do
      long_link_count = click_tracker.sorted_count("2020", './spec/mock_data/mock_decodes.json', './data/encodes.csv')

      expect(long_link_count).to eq([{"https://linkedin.com/"=>4}, {"https://github.com/"=>3}, {"https://youtube.com/"=>2}, {"https://twitter.com/"=>1}])
    end
  end
end