class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.references :event, foreign_key: true

      t.timestamps
    end

    add_foreign_key :invites, :users, :column => :sender_id
    add_foreign_key :invites, :users, :column => :receiver_id
    add_index :invites, [:sender_id, :receiver_id], unique: true
  end
end
