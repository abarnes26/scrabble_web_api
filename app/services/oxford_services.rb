class OxfordServices

  def initialize(param)
    binding.pry
    @param = param
  end

  def validate
    get_json()
  end

  private

    def conn
      Faraday.new(url: 'http://www.example.com')
response = conn.get '/users')

end
