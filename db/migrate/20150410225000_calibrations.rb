class Calibrations < ActiveRecord::Migration
  def change
    create_table :calibrations do |t|
      t.string :x_value
      t.string :y_value
      t.string :attempts
      t.string :green
      t.string :date
 
      t.timestamps null: false
      
      t.integer :monitor_id

    end
  end
end