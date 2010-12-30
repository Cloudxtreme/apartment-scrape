require 'open-uri'

class CraigslistUpdater
  def initialize(base_url, options={}, &block)
    @base_url = base_url
    @options = options
    @filter = block
  end

  def perform
    @since = @options[:since]
    @limit = @options[:limit]
    @limit = 500 if @since.nil? && @limit.nil?

    @count = 0
    @new_count = 0

    Rails.logger.info "Updating Craigslist postings for #{@base_url}"

    page = 0
    while parse_page(page += 1); end
  ensure
    Rails.logger.info "Finished updating Craigslist -- found #{@new_count} new postings"
    $stdout.puts
  end

  private

  def parse_page(page)
    url = @base_url
    url += "index%d.html" % [(page - 1) * 100] if page > 1

    Rails.logger.debug "Loading Craigslist index: #{url}"

    doc = Nokogiri::HTML(open(url))
    (doc/'/html/body/blockquote/p/a').each do |link|
      return false if !parse_link(link)
    end

    true
  end

  def parse_link(link)
    Rails.logger.debug "Parsing Craigslist posting: #{link['href']}"
    apt = Apartment.parse(link)

    # if post is flagged for removal
    if apt.nil?
      $stdout.write 'X'
      return true
    end

    @filter.call(apt)
    apt.save!

    @new_count += 1
    $stdout.write '.'
    return done?(apt)
  rescue => e
    if e.message =~ /column link is not unique/
      Rails.logger.info "Found duplicate posting: #{link['href']}"
      $stdout.write 'D'
    else
      Rails.logger.error "Error parsing posting: #{link['href']}"
      Rails.logger.error "#{e.message}: #{e.backtrace}"
      $stdout.write 'F'
    end
  ensure
    $stdout.flush
  end

  def done?(apt)
    unless @limit.nil?
      return false if (@count += 1) >= @limit
    end

    unless @since.nil?
      return false if apt.posted_at <= @since
    end

    true
  end
end
