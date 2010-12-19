require 'cgi'

class QueryParams < Hash
  def self.parse(query)
    parts = query.split('&').map do |s|
      key,val = s.split('=')
      [key.to_sym, CGI.unescape(val)]
    end
    self[parts]
  end
end
