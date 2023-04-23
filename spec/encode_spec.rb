require 'spec_helper'

RSpec.describe Encode do
  let(:google) {Encode.new("www.google.com", "bit.ly", "31Tt55y")}

  it "exists" do
    expect(google).to be_an(Encode)
  end

  it "has readable attributes 'long_link', 'domain', 'hash', and 'short_link'" do
    expect(google.long_link).to eq("www.google.com")
    expect(google.domain).to eq("bit.ly")
    expect(google.hash).to eq("31Tt55y")
    expect(google.short_link).to eq("http://bit.ly/31Tt55y")
  end
end