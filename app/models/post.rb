class Post < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  validates :title , presence: true , length: {maximum: 12}
  validates :image_url , presence: true
  validates :body , presence: true
end
