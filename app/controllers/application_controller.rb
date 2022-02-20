class ApplicationController < ActionController::Base
	include Pagy::Backend

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_locale
	protected
		def set_locale
			I18n.locale = "cs"
		end

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name,:surname,:email,:password])
			devise_parameter_sanitizer.permit(:account_update, keys:[:first_name,:surname,:email,:password])
		end
end
