class SessionsController < ApplicationController
    before_action :require_no_user!, only: [:create, :new]
    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user.nil? #We don't do a .save here since this is the session controller. We're just checking if the credentials entered work
            flash.now[:errors] = ["Invalid Credentials"]
            render :new
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    def new
        render :new
    end

end
