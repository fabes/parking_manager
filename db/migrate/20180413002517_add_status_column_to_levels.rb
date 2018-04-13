class AddStatusColumnToLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :levels, :space_available, :boolean
  end
end
