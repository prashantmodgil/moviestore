class RemoveColoumnCommenterIdFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :commenter_id, :integer
  end
end
