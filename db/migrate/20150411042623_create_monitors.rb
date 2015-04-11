class CreateMonitors < ActiveRecord::Migration
  def change
    create_table :monitors do |t|
      t.string :tag
      
      
      t.timestamps null: false
      
    end
  end
end
