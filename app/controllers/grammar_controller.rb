# frozen_string_literal: true

class GrammarController < ApplicationController
  require "net/http"
  def index
    if request.xhr?
      text = params[:text].chop

      url = URI.parse("https://www.abbreviations.com/services/v2/grammar.php?uid=" +
                      ENV["grammar_user_id"] + "&tokenid=" + ENV["grammar_token"] + "&text=" + text)

      response = Net::HTTP.get(url)
      data = JSON.parse(response)
      respond_to do |format|
        format.json { render json: data }
      end
    end
  end
end
