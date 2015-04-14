class CreateMonitors < ActiveRecord::Migration
  def change
    create_table :dream_color_monitors do |t|
      t.string :tag
      t.timestamps null: false
    end
  end
end