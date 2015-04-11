class AddColumnToCalibration < ActiveRecord::Migration
  def change
    add_column :calibrations, :luminance, :string
  end
end
