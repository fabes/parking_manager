class Level < ApplicationRecord

  def selected_level 
    self
  end

  def self.parking_spaces_overview 
    #loop through current level to see if park spaces is available
    parking_spots = []
    current_floor_level = 0

    3.times do 
      current_floor_level += 1
      parking_status = self.where(floor_level: current_floor_level).all
      parking_spots << parking_status
    end
    parking_spots
  end

end
