class ApplicationController < ActionController::Base
    before_action :set_locale
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def set_locale
        if params[:locale]
            cookies[:locale] = params[:locale]
        end

        if cookies[:locale]
            if I18n.locale != cookies[:locale]
                I18n.locale = cookies[:locale]
            end
        end
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end
end
