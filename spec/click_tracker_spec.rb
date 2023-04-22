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
    let(:click_tracker) {ClickTracker.new}

    it "adds new encodes to the click tracker encodes array" do
      expect(click_tracker.encodes).to eq([])

      click_tracker.add_csv_encodes('./data/encodes.csv')

      expect(click_tracker.encodes.length).to eq(6)
      expect(click_tracker.encodes[0].long_link).to eq("https://google.com/")
      expect(click_tracker.encodes[0].short_link).to eq("http://bit.ly/31Tt55y")
      expect(click_tracker.encodes[5].long_link).to eq("https://youtube.com/")
      expect(click_tracker.encodes[5].short_link).to eq("http://bit.ly/2lNPjVU")
    end
  end

  describe '#parse_decodes' do
    let(:click_tracker) {ClickTracker.new}

    it "parses decodes json files provided" do
      decodes = click_tracker.parse_decodes_json('./data/decodes.json')
    
      expect(decodes).to be_an(Array)
      expect(decodes[0]).to be_a(Hash)
      expect(decodes[0].keys).to include("bitlink", "user_agent", "timestamp", "referrer", "remote_ip")
    end
  end

  describe '#count_clicks_by_year' do
    let(:click_tracker) {ClickTracker.new}

    it "counts the clicks(elements from the parsed json array) based on the year provided" do
      link_count = click_tracker.count_clicks_by_year("2021", './spec/mock_data/mock_decodes.json')

      expect(link_count).to be_a(Hash)
      expect(link_count).to eq({"http://es.pn/3MgVNnZ"=>2, 
                                "http://bit.ly/2kjqil6"=>2, 
                                "http://bit.ly/2kkAHNs"=>1, 
                                "http://bit.ly/2kJdsg8"=>2, 
                                "http://bit.ly/2lNPjVU"=>1, 
                                "http://bit.ly/2kJO0qS"=>1, 
                                "http://bit.ly/2kJej0k"=>1
                                }
                              )
    end
  end
end