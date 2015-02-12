class AddOpenedToCalendarDay < ActiveRecord::Migration
  def change
    add_column :calendar_days, :opened, :boolean, :default => false
  end
end
