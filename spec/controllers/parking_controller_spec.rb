require 'rails_helper'

RSpec.describe ParkingController, type: :request do
  describe "#for_floor_level" do 
    params = {
      id: 1
    }

    let(:level){ Level.where(floor_level: params[:id]).first }
    let(:floor_level_parking){ JSON.parse(level.parking) }

    before do 
      Level.create(space_available: true, floor_level: 1)
    end

    it "should return available parking for given floor level" do
      get for_floor_level_parking_path(params)
      json_response = JSON.parse(response.body)
      #all zeros (10) for available parking spaces on floor level
      expect(json_response['data']).to eq([0,0,0,0,0,0,0,0,0,0])
    end
  end
end
