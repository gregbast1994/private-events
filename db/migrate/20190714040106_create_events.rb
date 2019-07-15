class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :price
      t.string :location
      t.datetime :event_date
      t.references :user

      t.timestamps
    end
  end
end
