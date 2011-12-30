module Nom
  class Fetcher

    def post(path, body = {})
      url = url_for_path(path)
      go(url, Net::HTTP::Post, body)
    end

    def get(path, params = {})
      url = url_for_path(path)
      add_params(url, params)
      go(url, Net::HTTP::Get)
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

    def go(url, type, body=nil)
      http,uri = start(url)
      request = type.new(uri.request_uri)
      request.set_form_data(body) if(body.kind_of?(Hash) && body.present?)
      JSON.parse(http.request(request).body) rescue {}
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
