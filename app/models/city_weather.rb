class CityWeather < ApplicationRecord
  belongs_to :user
  validates :iata, presence: true, length: { is: 3 }
  validates :response, presence: { message: "Ocurrió un error en la consulta. Por favor vuelva a intentarlo" }

  def set_response
    self.response = WeatherApi.new.current(iata)
  end
end