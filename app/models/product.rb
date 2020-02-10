class Product < ApplicationRecord
  belongs_to :category
  enum status: [:unused, :near_unused, :no_dirt, :dirt_small, :dirt, :bad]
  enum postage: [:buyer, :vendor]
  enum estimated_date: [:early, :half, :late]
  enum shipping_area: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukushima, :ibaraki, :tochigi, :gunnma, :saitama, :chiba, :tokyo, :kanagawa, :niigata, :toyama, :ishikawa, :fukui, :yamanashi, :nagano, :gihu, :shizuoka, :aichi, :mie, :shiga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :shimane, :okayama, :hiroshima, :yamaguchi, :tokushima, :kagawa, :ehime, :kouchi, :fukuoka, :saga, :nagasaki, :kumamoto, :ooita, :miyazaki, :kagoshima, :okinawa]
end
