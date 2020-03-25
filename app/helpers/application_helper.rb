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

    def source_helper(layout_name)
        if session[:source]
            greeting = "Thanks for visting me from  #{session[:source]} and you are on the #{layout_name} layout!"
            content_tag(:p, greeting, class: "source-greeting")
        end 
    end
    # style is the css class, tag_type example is an li
    def nav_helper style, tag_type
        #heredoc
nav_links = <<NAV
<#{tag_type}><a href="#{root_path}" class="#{style}">Home</a></#{tag_type}>
<#{tag_type}><a href="#{about_me_path}" class="#{style}">About Me</a></#{tag_type}>
<#{tag_type}><a href="#{contact_path}" class="#{style}">Contact</a></#{tag_type}>
<#{tag_type}><a href="#{blogs_path}" class="#{style}">Blog</a></#{tag_type}>
<#{tag_type}><a href="#{portfolios_path}" class="#{style}">Portfolio</a></#{tag_type}>
NAV
        nav_links.html_safe
    end
end
