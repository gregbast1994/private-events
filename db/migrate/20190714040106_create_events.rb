class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :where
      t.datetime :when
      t.references :user

      t.timestamps
    end
  end
end
