class CreateDreamColors < ActiveRecord::Migration
  def change
    create_table :dream_colors do |t|
      t.string :tag
    end

  end
end
