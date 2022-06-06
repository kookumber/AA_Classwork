class UsersController < ApplicationController

    before_action :require_current_user!, except: [:create, :new]
    before_action :require_no_user!, only: [:create, :new]

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user) #Upon creation of the user, we auto log them in
            redirect_to user_url(@user) #Redirect them to their page
        else
            #When you fail a validation, the flash object can handle all the error messages
            # flash.now(:errors) = @user.errors.full_message
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    def show
        render :show
    end



    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
