class Dream < ActiveRecord::Migration
  create_table :dream_color_cal do |t|
    t.column :tag, :string
    t.column :luminance, :string
    t.column :x_value, :string
    t.column :y_value, :string
    t.column :attempts, :string
    t.column :date, :string
    t.column :green, :string
  end
end
