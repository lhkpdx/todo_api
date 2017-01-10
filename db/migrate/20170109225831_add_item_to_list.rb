class AddItemToList < ActiveRecord::Migration
  def change
    add_reference :lists, :item, index: true, foreign_key: true
  end
end
