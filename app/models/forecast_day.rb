class ForecastDay
  attr_reader :pretty,
              :high,
              :low,
              :conditions,
              :date

  def initialize(date_info)
    # binding.pry
    @date = date_info[:date][:pretty]
    @high = date_info[:high][:fahrenheit]
    @low = date_info[:low][:fahrenheit]
    @conditions = date_info[:conditions]
  end

  def self.ten_day(zip)
    dates = WundergroundService.new.ten_day(zip)
    dates.map do |date_info|
      ForecastDay.new(date_info)
    end
  end
end
