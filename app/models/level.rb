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
      parking_spots = level_with_space.parking
      next_parking_spot = parking_spots.size + 1
    end
    next_parking_spot
  end

  def max_profit(vehicles_list)
    #select floor that has available special_parking
    floor = self.where(special_parking: []).first

    special_parking_spots = []
    max_space = 50
    #iterate through vehicles lists
    vehicles_list.each do |i| 
      (0..vehicles_list.size - 1).each do |i|
        vehicle1 = vehicles_list[i]
        vehicles_list.each do |k| 
          #place vehicles into special parking array
          if vehicle1[:size] + k[:size] <= max_space 
            special_parking_spots << vehicle1
            special_parking_spots << k
          end
        end
        break if not special_parking_spots.empty?
      end
      special_parking_spots
    end
  end
end
