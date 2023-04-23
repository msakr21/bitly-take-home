class Encode
  attr_reader :long_link,
              :domain,
              :hash,
              :short_link

  def initialize(long_link, domain, hash)
    @long_link = long_link
    @domain = domain
    @hash = hash
    @short_link = "http://#{domain}/#{hash}"
  end
end