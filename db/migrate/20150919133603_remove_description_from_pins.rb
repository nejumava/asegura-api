class RemoveDescriptionFromPins < ActiveRecord::Migration
  def change
    remove_column :pins, :description, :text
  end
end
