require 'rails_helper'

RSpec.describe CityWeather, :type => :model do
  let(:user) { FactoryBot.create(:user) }

  it "Cuando los atributos son válidos, entonces es válido" do
    city_weather = CityWeather.new
    city_weather.user = user
    city_weather.iata = 'abc'
    allow_any_instance_of(WeatherApi).to receive(:current) do
      { location: { city: 'name' } }
    end
    city_weather.set_response
    expect(city_weather).to be_valid
  end

  it "Cuando WeatherApi falla, entonces no es válido" do
    city_weather = CityWeather.new
    city_weather.user = user
    city_weather.iata = 'abc'
    allow_any_instance_of(WeatherApi).to receive(:current) { nil }
    city_weather.set_response
    expect(city_weather).to_not be_valid
  end

  it "Cuando response está vacío, entonces no es válido" do
    city_weather = CityWeather.new
    city_weather.user = user
    city_weather.iata = 'abc'
    city_weather.response = nil
    expect(city_weather).to_not be_valid
  end
end