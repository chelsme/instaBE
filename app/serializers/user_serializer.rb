class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :username, :password, :password_confirmation, :bio, :avatar

  has_many :posts
  has_many :likes
  has_many :comments
end
