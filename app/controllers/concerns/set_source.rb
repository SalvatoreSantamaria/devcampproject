module SetSource
    extend ActiveSupport::Concern

    included do
        before_action :set_source
    end

    def set_source
        session[:source] = params[:q] if params[:q] #set only if params[:q] exists
    end
end

    

