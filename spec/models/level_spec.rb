require 'rails_helper'

RSpec.describe Level, type: :model do
  describe "#find_parking_spot" do 
    let(:level_with_space) { Level.where(space_available: true).first }
    let(:next_parking_spot) { JSON.parse(level_with_space.parking).size + 1 }

    context "when availabe" do 
      before do 
        Level.create(space_available: true, floor_level: 1)
      end
        
      it "should return level on which parking spot is available" do
        expect(level_with_space.floor_level).to eq(1)
      end
  
      it "should return the parking spot available" do 
        expect(next_parking_spot).to eq(1)
      end
    end

    context "when none available" do 
      before do 
        Level.create(space_available: false, floor_level: 2)
      end
      
      it "should return nil for floor level" do
        expect(level_with_space).to be_nil()
      end
      
    end
  end
end