class ModifyLevelsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :levels, :parking, :json, default: {}
    remove_column :levels, :parking_lot_1
    remove_column :levels, :parking_lot_2
    remove_column :levels, :parking_lot_3
    remove_column :levels, :parking_lot_4
    remove_column :levels, :parking_lot_5
    remove_column :levels, :parking_lot_6
    remove_column :levels, :parking_lot_7
    remove_column :levels, :parking_lot_8
    remove_column :levels, :parking_lot_9
    remove_column :levels, :parking_lot_10
  end
end
