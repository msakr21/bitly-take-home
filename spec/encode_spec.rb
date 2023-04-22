require 'spec_helper'

RSpec.describe Encode do
  let(:google) {Encode.new("www.google.com", "bit.ly/31Tt55y")}

  it "exists" do
    expect(google).to be_an(Encode)
  end

  it "has readable attributes 'long_link' and 'short_link'" do
    expect(google.long_link).to eq("www.google.com")
    expect(google.short_link).to eq("bit.ly/31Tt55y")
  end
end