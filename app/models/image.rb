class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :product
  validates :product, presence: true
  validates :image, presence: true
end
