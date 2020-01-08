class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    #run this before everything else is run in the controller. because this is the master application_controller (that everyting else inheirits from!) this will run before anything else in every controller!
    #changed from before_filter because it wasn't working
    before_action :configure_permitted_parameters, if: :devise_controller?

    #instasiate the configure_permitted_paramets
    def configure_permitted_parameters 
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
