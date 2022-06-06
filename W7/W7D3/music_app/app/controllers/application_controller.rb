class ApplicationController < ActionController::Base
    
    helper_method :current_user

    def current_user #returns the current user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in? #returns true or false

    end

    def login!(user) #reset the user's session token and cookie
        @current_user = user
        session[:session_token] = user.session_token #Here, we're simply setting the session[:session_token] to be
        # the user', we created or logged in as, session token, which we set with the ensure session token method
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
    end

    def require_current_user!
        redirect_to new_session_url if current_user.nil?
    end

    def require_no_user!
        redirect_to user_url(current_user) if !current_user.nil?
    end
end
