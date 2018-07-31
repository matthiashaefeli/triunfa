# frozen_string_literal: true

class ComunityController < ApplicationController
  before_action :logged_in
  before_action :expired

  def index
    @articles = Article.all
  end
end
