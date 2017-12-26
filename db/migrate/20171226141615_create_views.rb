class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.references :movie
      t.timestamps
    end
  end
end
