class ParkingController < ApplicationController  
  def for_floor_level
    level = Level.where(floor_level: params[:id]).first
    floor_level_parking = JSON.parse(level.parking)

    unassigned_spaces = []
    10.times do |i| 
      if floor_level_parking[i].nil? 
        unassigned_spaces << 0
      elsif 
        unassigned_spaces << floor_level_parking[i]
      end
    end

    render json: {
      data: unassigned_spaces
    }
  end

  def find_spot
    vehicle_info = allowed_vehicle_params
    sizes_and_costs = vehicle_sizes_costs_list

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
    self.book_by_spot
  end

  def book_by_spot 
    parking_data = Level.book_parking(allowed_vehicle_params)

    if parking_data 
      render :success
    else
      render :bad_request
    end
  end

  private 
  
  def allowed_vehicle_params 
    params.permit(
      :vehicle_brand, 
      :vehicle_size, 
      :price_for_parking,
      :parking_spot, 
      :parking_spot_level
      )  
  end

end
