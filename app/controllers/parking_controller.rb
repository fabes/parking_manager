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

  def find_parking_spot 
    available_parking = Level.find_parking_spot({brand: 'Dodge', size: 20, price: 100})
    render json: {
      available_parking: available_parking
    }
  end 

end
