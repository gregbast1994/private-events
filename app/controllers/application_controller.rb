class ApplicationController < ActionController::Base
    include SessionsHelper
    include RsvpsHelper

    def require_login
        unless logged_in?
            flash[:info] = "You must log in first."
            store_location
            redirect_to login_path
        end
    end
end
