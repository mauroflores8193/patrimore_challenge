class CityWeathersController < ApplicationController
  before_action :authenticate_user!

  def new
    @city_weather = CityWeather.new
  end

  def show
    @city_weather = CityWeather.find(params[:id])
  end

  def create
    @city_weather = CityWeather.new(city_weather_params)
    @city_weather.user = current_user
    @city_weather.set_response
    if @city_weather.save
      redirect_to @city_weather
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def city_weather_params
    params.require(:city_weather).permit(:iata)
  end
end
