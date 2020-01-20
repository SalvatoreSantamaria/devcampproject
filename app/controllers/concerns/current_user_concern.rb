module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user #overriding
        #for having a guest user. if super is true, then application is normal. if super is false, 
        #then run the guest function on the right 
        super || guest_user
    end

    def guest_user
        OpenStruct.new(name: "Guest User", first_name: "Guest", last_name: "User", email: "guest@email.com")
    end
end