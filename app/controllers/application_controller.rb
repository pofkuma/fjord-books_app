# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[zipcode address biography])
  end

  def signed_in_root_path(resource_or_scope)
    user_path(resource_or_scope)
  end

  def after_sign_in_path_for(_resource_or_scope)
    books_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
