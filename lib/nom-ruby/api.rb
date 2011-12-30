module Nom
  class API
    
    def here(lat, lng, options = {})
      start, limit = Nom::Util.page(options)
      Nom::API.handle.get('/locations/here', {
        :lat => lat,
        :lng => lng,
        :dist => (options[:dist] || 0.5),
        :start => start,
        :limit => limit
      })
    end

    def location_search(query, options = {})
      start, limit = Nom::Util.page(options)
      params = { :query => query }

      params.merge!({
        :lat => options[:lat],
        :lng => options[:lng]
      }) if(options[:lat].present? && options[:lng].present?)

      params.merge!({
        :location => options[:location]
      }) if options[:location].present?

      Nom::API.handle.get('/locations/search', params)
    end

    def register(email, password, options ={})
      Nom::API.handle.post('/users/register', {
        :email => email,
        :password => password,
        :screen_name => options[:screen_name],
        :name => options[:name],
        :city => options[:city]
      })
    end

    # Any item out of email, user_nid, screen_name will work
    def login(password, options ={})
      Nom::API.handle.post('/users/login', {
        :password => password,
        :email => options[:email],
        :user_nid => options[:user_nid],
        :screen_name => options[:screen_name]
      })
    end

    def user_search(query, options = {})
      start, limit = Nom::Util.page(options)
      Nom::API.handle.get('/locations/search', {
        :query => query, # If the input value is of unknown origin
        :screen_name => options[:screen_name],
        :email => options[:email]
      })
    end

    private
    
    # keep this around for re-use
    def self.handle
      @handle ||= Nom::Fetcher.new # (:key => Nom::Keys.developer, :secret => Nom::Keys.secret)
    end

  end
end