class AddThumbnailToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :thumbnail, :string
  end
end
