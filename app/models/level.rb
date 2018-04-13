class Level < ApplicationRecord
  def selected_level 
    if self 
      return [
        parking: self.parking,
        special_parking: self.special_parking,
      ]
    end
    return nil
  end

  def self.find_parking_spot(for_vehicle) 
    next_parking_spot = 0
    level_with_space = self.where(space_available: true).first
    if level_with_space 
      parking_spots = JSON.parse(level_with_space.parking)
      next_parking_spot = parking_spots.size + 1
    end
    {
      spots: next_parking_spot,
      level: level_with_space.floor_level
    }
  end

  def self.book_parking(vehicle_info) 
    parking_data = self.where(floor_level: vehicle_info[:level]).first
    new_parking_data = JSON.parse(parking_data.parking).insert(vehicle_info[:spot] - 1, 1)

    parking_data.parking = new_parking_data
    if new_parking_data.size == 10 
      parking_data.space_available = false
    end
    parking_data.save
  end

  def self.max_profit(vehicles_list)
    vehicles_list = [
      { brand: 'dodge', size: 15, price: 50 },
      { brand: 'dodge', size: 15, price: 50 },
      { brand: 'dodge', size: 15, price: 50 },
      { brand: 'audi', size: 20, price: 30 },
      { brand: 'mercedes', size: 10, price: 100 },
      { brand: 'jaguar', size: 45, price: 170 },
      { brand: 'bmw', size: 25, price: 150 },
    ]

    special_parking_spots = []
    max_space = 50
    sorted_arr_by_price = vehicles_list.sort_by{ |v| v[:price] }.reverse

    # given the outlined example, we can safely reject sizes > 25
    arr = sorted_arr_by_price.delete_if{ |x| x[:size] > 25 }

    # if Jimmy has 3 vehicles of size 10, he can get the max_profit based on example
    size_10_vehicles_array = sorted_arr_by_price.select{ |x| x[:size] == 10 }

    if size_10_vehicles_array.count >= 3 
      # iterate over first 3
      (0..2).each do |i| 
        special_parking_spots << size_10_vehicles_array[i]
      end

      return special_parking_spots
    end

    # guess we could do the same if we find 2 vehicles of size 25
    # will work on it if I get more time

    # if Jimmy didn't have 3 size 10 vehicles, then we continue to iterate over sorted array
    (0..arr.size - 1).each do |i| 
      max_space -= arr[i][:size]
      if (max_space <= 50 && max_space >= 0) 
        special_parking_spots << arr[i]
      end
      break if max_space <= 0
    end
    return special_parking_spots
  end
end
