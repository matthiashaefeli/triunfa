# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  include ServiceUser

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!, except: [:index]

  before_action :check_language


  protected

    def configure_permitted_parameters
      added_attrs = [ :name, :lastname, :email, :password, :password_confirmation,
                      :remember_me, :street, :city, :tel, :state, :cp, :avatar, :birthdate, :nationality]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
