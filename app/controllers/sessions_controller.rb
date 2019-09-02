class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    log_in user
    redirect_to helpers_sessions_path, notice:'Successfuly logged in'
    else
    flash.now[:danger] = 'Invalid login information'
    redirect_to root_path
    end
  end

  def destroy
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id:session[user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

end
