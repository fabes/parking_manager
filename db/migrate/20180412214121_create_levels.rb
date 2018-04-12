class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.integer   :floor_level
      t.integer   :parking_lot_1,      default: 0
      t.integer   :parking_lot_2,      default: 0
      t.integer   :parking_lot_3,      default: 0
      t.integer   :parking_lot_4,      default: 0
      t.integer   :parking_lot_5,      default: 0
      t.integer   :parking_lot_6,      default: 0
      t.integer   :parking_lot_7,      default: 0
      t.integer   :parking_lot_8,      default: 0
      t.integer   :parking_lot_9,      default: 0
      t.integer   :parking_lot_10,     default: 0
      t.json      :special_parking,    default: {}

      t.timestamps
    end
  end
end
