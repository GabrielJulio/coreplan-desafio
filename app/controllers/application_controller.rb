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
        added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me, :avatar, :full_name, :nickname, :birth_date]
        devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
        devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
        devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    end
end
