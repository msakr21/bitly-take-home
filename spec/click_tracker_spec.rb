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
    let(:click_tracker) {ClickTracker.new()}

    it "creates adds new encodes to the click tracker encodes array" do
      expect(click_tracker.encodes).to eq([])

      click_tracker.add_csv_encodes('./data/encodes.csv')

      expect(click_tracker.encodes.length).to eq(6)
      expect(click_tracker.encodes[0].long_link).to eq("https://google.com/")
      expect(click_tracker.encodes[0].short_link).to eq("http://bit.ly/31Tt55y")
      expect(click_tracker.encodes[5].long_link).to eq("https://youtube.com/")
      expect(click_tracker.encodes[5].short_link).to eq("http://bit.ly/2lNPjVU")
    end
  end
end