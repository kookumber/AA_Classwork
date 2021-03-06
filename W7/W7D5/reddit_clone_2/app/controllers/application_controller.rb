class ApplicationController < ActionController::Base

    helper_method :current_user, :require_logged_in

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in 
        redirect_to new_session_url if !logged_in?  # can change the url later
    end 

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end 

    def logged_in?
        !!current_user
    end 

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
        redirect_to new_session_url
    end

end
