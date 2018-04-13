class ChangeColTypesforLevels < ActiveRecord::Migration[5.1]
  def change
    change_column :levels, :parking, :text
    change_column :levels, :special_parking, :text
  end
end
