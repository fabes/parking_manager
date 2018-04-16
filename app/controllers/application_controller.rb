class ApplicationController < ActionController::API
  include AbstractController::Helpers
  helper_method :vehicle_sizes_costs_list, :sample_vehicles_list

  def vehicle_sizes_costs_list 
    {
      10 => 30,
      15 => 50,
      20 => 60,
      25 => 80,
      30 => 120,
      45 => 170
    }
  end

  def sample_vehicles_list 
    [
      { brand: 'dodge', size: 15, price: 50 },
      { brand: 'dodge', size: 15, price: 50 },
      { brand: 'dodge', size: 15, price: 50 },
      { brand: 'audi', size: 20, price: 30 },
      { brand: 'mercedes', size: 10, price: 100 },
      { brand: 'jaguar', size: 45, price: 170 },
      { brand: 'bmw', size: 25, price: 150 },
    ]  
  end

end
