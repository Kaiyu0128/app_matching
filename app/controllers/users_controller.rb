class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user=User.new(user_params)

    if @user.save
      redirect_to root_path, flash: {success: "Your account is successfuly created"}
    else
      flash.now[:alert] = "Account creation failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #params.permit(:name, :email, :password, :password_confirmation)
  end
end
