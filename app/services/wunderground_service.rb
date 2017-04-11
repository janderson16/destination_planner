class WundergroundService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("http://api.wunderground.com/")
    @auth = "#{ENV["key"]}"
  end

  def ten_day(zip)
    parse(connection.get("api/#{@auth}/forecast10day/q/#{zip}.json"))[:forecast][:simpleforecast][:forecastday]
    # binding.pry
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
