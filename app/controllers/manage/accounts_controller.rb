class Manage::AccountsController < ApplicationController
  before_action :authenticate_user!, :auth_admin

  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
  end


  def filtered_results
    @users = User.all
    unless params[:name].nil?
      @users = @users.where("name LIKE ?", "%#{params[:name]}%").order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
    end
  end

  private
  def auth_admin
    if current_user.admin == false
      redirect_to '/'
    end

  end
end
