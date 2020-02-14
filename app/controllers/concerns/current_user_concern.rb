module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user #overriding
        #for having a guest user. if super is true, then application is normal. if super is false, 
        #then run the guest function on the right 
        super || guest_user
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@guest.com"
        guest
    end
end