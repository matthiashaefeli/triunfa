class TranslateController < ApplicationController
  require 'net/http'
  include ServiceUser
  before_action :logged_in

  def index 
    if request.xhr?
      text = params[:text].chop
      url = URI.parse("https://translate.yandex.net/api/v1.5/tr.json/translate?key=" + 
                      ENV["traductor_api"] + "&lang=" + params[:language] + "&text=" + text)
      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      respond_to do |format|
        format.json {render :json => data}
      end
    end
  end
  
end
