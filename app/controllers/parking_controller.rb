class ParkingController < ApplicationController

  def overall_spaces_status 
    parking_spaces = Level.parking_spaces_overview
    render json:{
      data: parking_spaces
    } 
  end

  def for_floor_level
    level = Level.where(floor_level: params[:id]).first
    render json: {
      data: level.selected_level
    }
  end

end
