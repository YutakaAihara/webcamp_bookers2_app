class AddGroupIdToGroupMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :group_messages, :group_id, :integer
  end
end
