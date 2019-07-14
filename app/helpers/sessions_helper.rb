module SessionsHelper
    def log_in(user)
        session[:id] = user.id unless logged_in? 
    end

    def current_user
        @current_user ||= User.find(session[:id])
    end

    def logged_in?
        !session[:id].nil?
    end

    def log_out
        @current_user = nil
        session[:id] = nil
    end
        
end
