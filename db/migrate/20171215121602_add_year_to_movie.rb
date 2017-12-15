class AddYearToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :year, :date
  end
end
