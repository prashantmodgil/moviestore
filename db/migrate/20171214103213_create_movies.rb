class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genere
      t.text :descripton
      t.text :cast

      t.timestamps
    end
  end
end
