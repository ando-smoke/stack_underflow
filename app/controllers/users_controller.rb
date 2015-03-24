class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You're in! Get ready for underflow!"
      redirect_to '/'
    else
      flash[:alert] = "User account creation denied! Try again."
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user)
            .permit(:name, :email, :password, :password_confirmation)
    end
end
