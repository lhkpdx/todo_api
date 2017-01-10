class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :created_at, :updated_at
end
