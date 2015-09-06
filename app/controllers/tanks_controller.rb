class TanksController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    @tanks = Tank.all
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

