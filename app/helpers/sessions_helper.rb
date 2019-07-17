module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id unless logged_in? 
    end

    def current_user
        @current_user ||= User.find(session[:user_id])
    end

    def log_out
        @current_user = nil
        session[:user_id] = nil
    end

    def logged_in?
        !session[:user_id].nil?
    end

    def store_location
        session[:original_url] = request.original_url if request.get?
    end

    def redirect_back_or(default)
        redirect_to (session[:original_url] || default)
        session.delete(:original_url)
    end
        
end
