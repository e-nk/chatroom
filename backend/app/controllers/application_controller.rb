class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    include CurrentUserConcern

    def banned 
        @current_user.banned?
    end

end
