class OxfordServices

  def initialize(param)
    @param = param
  end

  def validate
    get_json("inflections/en/#{param}")
  end

  private
    attr_reader :param

    def conn
      Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
        faraday.headers["app_key"] = ENV["OXFORD_API_KEY"]
        faraday.headers["app_id"]  = ENV["OXFORD_ID"]
        faraday.adapter              Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
