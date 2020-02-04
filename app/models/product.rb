class Product < ApplicationRecord
  enum status: [:unused, :near_unused, :no_dirt, :dirt_small, :dirt, :bad]
  enum postage: [:buyer, :vendor]
  enum estimated_date: [:early, :half, :late]
  has_many :images, dependent: :destroy
end
