module ApplicationHelper
    def login_helper
        # have to use .html_safe or this won't process. 
       # "<p>My helper</p>".html_safe  
        if current_user.is_a?(User)
            link_to "Logout", destroy_user_session_path, method: :delete
        else
            # need to concat because ruby will return the last item only
            (link_to "Register", new_user_registration_path) + "<br>".html_safe + 
            (link_to "Login", new_user_session_path)
        end  
    end
end
