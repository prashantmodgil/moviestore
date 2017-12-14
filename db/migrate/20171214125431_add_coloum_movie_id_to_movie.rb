class AddColoumMovieIdToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :movie_id, :integer
  end
end
