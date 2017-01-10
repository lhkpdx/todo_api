class RemoveUserFromItems < ActiveRecord::Migration
  def change
    remove_reference :items, :user, index: false, foreign_key: false
  end
end
