require 'craigslist_updater'

URL = 'http://sfbay.craigslist.org/sfc/apa/'
CraigslistUpdater.new(URL, :since => Time.now - 3.days).perform
