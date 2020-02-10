class Category < ApplicationRecord
  belongs_to :product
  has_ancestry
end
