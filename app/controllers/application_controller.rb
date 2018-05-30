class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_player!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :team_id, :position, :photo, :alias])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :team_id, :position, :photo, :alias])
  end
end
