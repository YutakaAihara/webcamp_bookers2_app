class CreateGroupMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :group_messages do |t|
      t.string :mail_title
      t.text :mail_body

      t.timestamps
    end
  end
end
