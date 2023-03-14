require 'net/https'
require 'uri'

class WeatherApi
  def current(iata)
    Rails.cache.fetch(['weather_api', iata], expires_in: 1.minutes) do
      uri = URI("http://api.weatherapi.com/v1/current.json?" + { 'key': '3ba8a7019941413685353040231403', 'lang': 'es', 'q': "iata:#{iata}" }.to_query)
      response = Net::HTTP.get_response(uri)
      response.is_a?(Net::HTTPSuccess) ? JSON.parse(Net::HTTP.get(uri)) : nil
    end
  end
end
