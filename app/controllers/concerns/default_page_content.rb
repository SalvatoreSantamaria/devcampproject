module DefaultPageContent
    extend ActiveSupport::Concern
    included do
        before_action :set_page_defaults
    end

    def set_page_defaults
        @page_title = "DevCamp Portfolio Website"
        @seo_keywords = "Salvatore Santamaria DevCamp Portfolio Project"
    end
end