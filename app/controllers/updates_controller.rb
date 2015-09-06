class UpdatesController < ApplicationController

  def index
    @tank = Tank.find(params[:tank_id])
    @updates = Tank.find(params[:tank_id]).updates
  end

  def create
    update = Update.create(update_params)
    update.update_attributes(tank_id: params[:tank_id])
    render :json => [{amonia: update.amonia.to_f, nitrite: update.nitrite.to_f, nitrate: update.nitrate.to_f, temp: update.temp.to_f, created_at: update.created_at.strftime('%b %d, %Y')}]
  end

  private

  def update_params
    params.permit(:temp, :amonia, :nitrate, :nitrite)
  end
end
