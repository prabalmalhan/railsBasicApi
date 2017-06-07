class VideoSerializer < ActiveModel::Serializer

ActiveModel::Serializer.root = false
  attributes :id, :eid, :title, :ty, :videourl, :videoid, :created_at
  has_one :user
  # has_many :comments


end
