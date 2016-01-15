class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login successful!"
      remember user
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to '/'
    else
      flash[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    flash[:notice] = "Logout successful!"
    log_out if logged_in?
    redirect_to '/'
  end
end
