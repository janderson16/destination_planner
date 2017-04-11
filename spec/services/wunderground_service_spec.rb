require 'rails_helper'

describe WundergroundService do
  attr_reader :service

  before(:each) do
    @service = WundergroundService.new
  end

  describe '#ten_day' do
    it "returns 10 day forecast for a city" do
      VCR.use_cassette("services/ten_day") do
        forecast = @service.ten_day(80203)
        # binding.pry
         expect(forecast.count).to eq(10)
         expect(forecast[0][:date][:pretty]).to eq("7:00 PM MDT on April 10, 2017")
       end
    end
  end

end
