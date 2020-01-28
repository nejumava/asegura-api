class AddImageUrlToPins < ActiveRecord::Migration
  def change
    add_column :pins, :image_url, :string
  end
end
