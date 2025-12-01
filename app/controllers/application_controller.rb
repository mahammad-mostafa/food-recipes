class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to(root_url, alert: 'Record not found')
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(root_url, alert: exception.message)
  end

  def index
    redirect_to(root_url, alert: 'Invalid path')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
end
