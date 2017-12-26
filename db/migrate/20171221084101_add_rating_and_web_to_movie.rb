class AddRatingAndWebToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :rating, :float
    add_column :movies, :web, :string
  end
end
