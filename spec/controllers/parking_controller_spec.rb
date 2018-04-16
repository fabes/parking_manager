require 'rails_helper'

RSpec.describe ParkingController, type: :request do
  params = {
    vehicle_brand: 'audi', 
    vehicle_size: 10,
    parking_spot_level: 1, 
    parking_spot: 2,
    id: 1,
  }

  before do 
    Level.create(space_available: true, floor_level: 1, parking: [0,0,0])
  end

  describe "GET #for_floor_level" do 
    let(:level){ Level.where(floor_level: params[:id]).first }
    let(:floor_level_parking){ JSON.parse(level.parking) }

    it "should return available parking for given floor level" do
      get for_floor_level_parking_path(params)
      json_response = JSON.parse(response.body)
      #all zeros (10) for available parking spaces on floor level
      expect(json_response['data']).to eq([0,0,0,0,0,0,0,0,0,0])
      expect(response.headers["Content-Type"]).to eq('application/json; charset=utf-8')
    end
  end

  describe "POST #find_spot" do
    let(:available_parking){ Level.find_parking_spot(params) }

    it "should return json data" do 
      post find_spot_parking_index_path(params)
      expect(response.headers["Content-Type"]).to eq('application/json; charset=utf-8')
    end
  end

  describe "POST #book_by_size" do 
    it "should return status :success" do 
      post book_by_size_parking_index_path(params)
      Level.book_parking(params)
      expect(response).to have_http_status(:success)
    end
  end

end
