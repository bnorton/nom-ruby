module Nom
  class API
    
    def here(lat, lng, options = {})
      puts "HERE #{lat} - #{lng} - #{options.inspect}"
      start, limit = Nom::Util.page(options)
      Nom::API.handle.get('/locations/here', {
        :lat => lng,
        :lng => lng,
        :dist => (options[:dist] || 0.5),
        :start => start,
        :limit => limit
      })
    end

    # keep this around for performance reasons
    def self.handle
      @handle ||= Nom::Fetcher.new # (:key => Nom::Keys.developer, :secret => Nom::Keys.secret)
    end
    
  end
end