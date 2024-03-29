module ApplicationHelper
    #set login_helper style to an empty string. fixes wrong number of arguments bug.
    def login_helper style = ""
        if current_user.is_a?(GuestUser)
            # need to concat because ruby will return the last item only
            (link_to "Register", new_user_registration_path, class: style) + 
            (link_to "Login", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end  
    end

    def sample_helper
        content_tag(:div, "My content", class: "my-class")
    end

    def source_helper(styles)
        if session[:source]
            greeting = "Thanks for visting me from  #{session[:source]}"
            content_tag(:div, greeting.html_safe, class: styles)
        end 
    end


    def nav_items
        [
            {
                url: root_path,
                title: 'Home'
            },
            {
                url: about_me_path,
                title: 'About'
            },            
            {
                url: contact_path,
                title: 'Contact'
            },
        {
                url: blogs_path,
                title: 'Blog'
            },
            {
                url: portfolios_path,
                title: 'Portfolio'
            },
        ]
    end 

    # style is the css class
    def nav_helper style, tag_type
        nav_links = '' 
        nav_items.each do |item|
            nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
        end
        nav_links.html_safe
    end

    def active? path
            # return active if the current page matches whatever the path is
        "active" if current_page? path
    end

    def alerts 
        #this will return nil if none of these are true
        alert = (flash[:alert] || flash[:error] || flash[:notice]) 

        #if alert is true
        if alert 
            #using the alert variable to pass in the alert value
            alert_generator(alert)
        end
    end 

    def alert_generator(alert)
        js add_gritter(alert, title: "Notice", sticky: false) 
    end
end
