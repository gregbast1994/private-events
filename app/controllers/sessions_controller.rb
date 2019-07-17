class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email] )
    if @user
      log_in @user
      redirect_back_or(@user)
    else
      flash.now[:danger] = "No user by that name..."
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Logged out"
    redirect_to root_url
  end
end
