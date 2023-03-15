require 'net/https'
require 'uri'

class WeatherApi
  def current(iata)
    Rails.cache.fetch(['weather_api', iata], expires_in: 1.minutes) do
      uri = URI("http://api.weatherapi.com/v1/current.json?" + { key: Rails.application.credentials.dig(:wheater_api, :key), lang: 'es', q: "iata:#{iata}" }.to_query)
      response = Net::HTTP.get_response(uri)
      response.is_a?(Net::HTTPSuccess) ? JSON.parse(Net::HTTP.get(uri)) : nil
    end
  end
end
