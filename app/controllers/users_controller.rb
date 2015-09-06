class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(user_params)
  end

  def sign_out
    current_user = nil
    redirect_to '/'
  end

  def display
    @displayed_user = User.find(params[:id])
  end

  protected


  def user_params
    params.permit(:name, :email, :password, :bio)
  end
end
