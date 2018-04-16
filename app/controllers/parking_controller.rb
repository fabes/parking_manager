class ParkingController < ApplicationController  
  def overall_spaces_status 
    parking_spaces = Level.parking_spaces_overview
    render json:{
      data: parking_spaces
    } 
  end

  def for_floor_level
    level = Level.where(floor_level: params[:id]).first

    floor_level_parking = JSON.parse(level.parking)
    #extra this to a method
    unassigned_spaces = []
    10.times do |i| 
      if floor_level_parking[i].nil? 
        unassigned_spaces << 0
      elsif 
        unassigned_spaces << floor_level_parking[i]
      end
    end
    #EOF extract
    render json: {
      data: unassigned_spaces
    }
  end

  def find_spot
    vehicle_info = allowed_vehicle_params

    sizes_and_costs = {
      10 => 30,
      15 => 50,
      20 => 60,
      25 => 80,
      30 => 120,
      45 => 170
    }

    price_for_spot = 0
    sizes_and_costs.each do |k| 
      price_for_spot = k[1] if k[0] == vehicle_info[:vehicle_size] 
    end

    available_parking = Level.find_parking_spot(vehicle_info)
    render json: {
      data: [
        available_parking[:spots],
        available_parking[:level],
        price_for_spot,
      ]
    }
  end

  def book_by_size
    vehicle_info = {
      brand: params[:vehicle_brand],
      size: params[:vehicle_size],
      price: params[:price_for_parking],
      spot: params[:parking_spot] - 1,
      level: params[:parking_spot_level],
    }

    parking_data = Level.book_parking(vehicle_info)

    if parking_data 
      render :success
    else
      render :bad_request
    end
  end

  def book_by_spot 
    vehicle_info = {
      brand: params[:vehicle_brand],
      spot: params[:parking_spot] - 1,
      level: params[:parking_spot_level],
    }

    parking_data = Level.book_parking(vehicle_info)

    if parking_data 
      render :success
    else
      render :bad_request
    end
  end

  private 
  
  def allowed_vehicle_params 
    params.permit(:brand, :vehicle_size)  
  end

end
