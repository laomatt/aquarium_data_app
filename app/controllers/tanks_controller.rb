class TanksController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def index
    @tanks = Tank.paginate(:page => params[:page], :per_page => 30)
  end

  def filtered_results
    @tanks = Tank.all
    unless params[:name].nil?
      @tanks = @tanks.where("name LIKE ?", "%#{params[:name]}%").order("created_at DESC").paginate(:page => params[:page], :per_page => 30)
    end
  end

  def new

  end

  def show
    @tank = Tank.find(params[:id])
  end

  def create
    tank = Tank.create(tank_params)
    current_user.tanks << tank
    render :json => tank
  end
end

private

def tank_params
  params.permit(:name, :gallons_size)
end

