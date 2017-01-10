class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :completed, :created_at, :updated_at, :list_id
end
