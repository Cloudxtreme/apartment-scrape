require 'craigslist_updater'

work = Geokit::Geocoders::GoogleGeocoder.geocode('330 Townsend St, San Francisco, CA')

URL = 'http://sfbay.craigslist.org/sfc/apa/'
CraigslistUpdater.new(URL, :since => Time.now - 3.days) do |apt|
  unless apt.address.blank?
    location = Geokit::Geocoders::GoogleGeocoder.geocode(apt.full_address)
    apt.latitude = location.lat
    apt.longitude = location.lng
    apt.ignore = location.distance_from(work) > 2.0 # miles
  end
end.perform
