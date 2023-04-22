class Encode
  attr_reader :long_link,
              :short_link

  def initialize(long_link, short_link)
    @long_link = long_link
    @short_link = short_link
  end
end