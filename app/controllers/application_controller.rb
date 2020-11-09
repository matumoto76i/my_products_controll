class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    redirect_to root_path
  end
end
