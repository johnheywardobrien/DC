class CreateMonitors < ActiveRecord::Migration
  def change
    create_table :dc_monitors do |t|
      t.string :tag
      
      
      t.timestamps null: false
      
    end
  end
end