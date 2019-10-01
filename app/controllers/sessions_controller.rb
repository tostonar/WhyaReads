class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to books_path
        else
            flash[:error] = "No user found with that email and password combination."
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end
end