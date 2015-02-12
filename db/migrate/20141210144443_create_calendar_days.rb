class CreateCalendarDays < ActiveRecord::Migration
  def change
    create_table :calendar_days do |t|
      t.date :starts
      t.text :description
      t.string :image_path

      t.timestamps
    end
  end
end
