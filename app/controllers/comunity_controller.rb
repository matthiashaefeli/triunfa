class ComunityController < ApplicationController
  before_action :logged_in
  before_action :expired
end
