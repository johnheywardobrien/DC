class CreateCalibrations < ActiveRecord::Migration
  def change
    create_table :calibrations do |t|
      t.integer :dream_color_monitor_id
      t.string :luminance
      t.string :x_value
      t.string :y_value
      t.string :attempts
      t.string :green
      t.string :date
 
      t.timestamps null: false
    end
  end
end