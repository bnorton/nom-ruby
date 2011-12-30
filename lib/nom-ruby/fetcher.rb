module Nom
  class Fetcher

    def post(path, params = {}, body = {})
      url = url_for_path(path)
      add_params(url, params)
      _post(url, body)
    end

    def get(path, params = {})
      url = url_for_path(path)
      add_params(url, params)
      _get(url)
    end

    private

    def port
      443
    end

    def base_url
      "https://justnom.it"
    end

    def start(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      [http, uri]
    end

    def _go(url,type)
      http,uri = start(url)
      request = type.new(uri.request_uri)
      JSON.parse(http.request(request).body) rescue {}
    end
    
    def _get(url)
      _go url, Net::HTTP::Get
    end

    def _post(url, body)
      _go url, Net::HTTP::Post
    end

    # always request json
    def url_for_path(path)
      url = "#{base_url}#{path}"
      url << '.json' unless url =~ /\.json$/
    end

    # if any params are present
    def add_params(url, params)
      return unless params.kind_of? Hash
      extra = (url =~ /\?/) ? "&" : "?"
      url << extra
      url << params.to_param unless params.blank?
    end
  end
end
