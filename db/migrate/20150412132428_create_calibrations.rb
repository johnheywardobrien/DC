class CreateCalibrations < ActiveRecord::Migration
  def change
    create_table :calibrations do |t|
      t.string :luminance
      t.string :x_value
      t.string :y_value
      t.string :attempts
      t.string :green
      t.string :date
 
      t.timestamps null: false
      t.belongs_to :dc_monitors, index:true
      t.integer :monitor_id
 
    end
  end
end