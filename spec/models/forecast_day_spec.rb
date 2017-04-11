require 'rails_helper'

describe ForecastDay do
  it "returns 10day forecast" do
    VCR.use_cassette("models/forecast_day") do

    forecast = ForecastDay.ten_day(80203)
    # binding.pry
    expect(forecast.first.class).to eq(ForecastDay)
    expect(forecast.count).to eq(10)
    end
  end
end
