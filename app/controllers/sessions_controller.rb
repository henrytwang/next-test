class SessionsController < ApplicationController

  def new
    @session = current_user || User.new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      flash[:success] = "You successfully logged in!"
      redirect_to user
    else
      flash.now[:error] = "Unsuccessful login attempt!"
      render "new"
    end
  end

  def destroy
    session.clear
    flash[:success] = "You successfully logged out!"
    redirect_to login_url
  end
end
