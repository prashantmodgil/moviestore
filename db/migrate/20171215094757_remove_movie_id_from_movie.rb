class RemoveMovieIdFromMovie < ActiveRecord::Migration[5.1]
  def change
    remove_column :movies, :movie_id, :integer
  end
end
