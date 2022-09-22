class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username name email password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login username password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username name email password_confirmation current_password
                                               remember_me])
  end
end
