class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :image, :caption

  has_many :likes
  has_many :comments
end
