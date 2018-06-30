# frozen_string_literal: true

class WeatherController < ApplicationController
  require "net/http"
  before_action :logged_in
  def index
    url = URI.parse("https://api.openweathermap.org/data/2.5/weather?zip=" +
                    current_user.cp.to_s + ",us&units=metric&APPID=" + ENV["weather_api"])
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    @weather = data["weather"][0]
    @main = data["main"]
    @iconurl = "http://openweathermap.org/img/w/" + @weather["icon"] + ".png"
  end
end
