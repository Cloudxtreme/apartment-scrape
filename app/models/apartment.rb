require 'query_params'

class Apartment < ActiveRecord::Base
  TITLE_REGEX = /^\$(\S+)\s+(\/\s+(\S+)\s+\-\s+)?(.*)$/

  def full_address
    [address, city_state_zip, country].join(', ')
  end

  def self.parse(link)
    attributes = {}

    # parse link
    link.inner_text.match(TITLE_REGEX)
    attributes[:price] = $1.to_f
    attributes[:bedrooms] = $3
    attributes[:title] = $4
    attributes[:link] = link['href']

    # parse body
    doc = Nokogiri::HTML(open(attributes[:link]))

    attributes[:posted_at] = Time.parse((doc/'/html/body').children[12].text)

    cats_item = (doc / 'ul[class=blurbs]/li').find {|li| li.text =~ /cats/}
    attributes[:cats] = !!(cats_item.text =~ /cats are OK - purrr/) unless cats_item.nil?

    # get address from link to Yahoo Maps
    yahoo_link = (doc/'/html/body/div/small/a').last
    unless yahoo_link.nil?
      query = QueryParams.parse(URI.parse(yahoo_link['href']).query)
      attributes[:address] = query[:addr]
      attributes[:city_state_zip] = query[:csz]
      attributes[:country] = query[:country]
    end

    self.new(attributes)
  end
end
