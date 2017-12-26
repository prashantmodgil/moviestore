class AddColumnToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :view_count, :int8
  end
end
