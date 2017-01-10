class RemoveItemFromLists < ActiveRecord::Migration
  def change
    remove_reference :lists, :item, index: false, foreign_key: false
  end
end
