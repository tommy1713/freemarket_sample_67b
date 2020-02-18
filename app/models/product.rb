class Product < ApplicationRecord
  enum status: [:unused, :near_unused, :no_dirt, :dirt_small, :dirt, :bad]
  enum postage: [:buyer, :vendor]
  enum estimated_date: [:early, :half, :late]
  enum shipping_area: [:hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukushima, :ibaraki, :tochigi, :gunnma, :saitama, :chiba, :tokyo, :kanagawa, :niigata, :toyama, :ishikawa, :fukui, :yamanashi, :nagano, :gihu, :shizuoka, :aichi, :mie, :shiga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :shimane, :okayama, :hiroshima, :yamaguchi, :tokushima, :kagawa, :ehime, :kouchi, :fukuoka, :saga, :nagasaki, :kumamoto, :ooita, :miyazaki, :kagoshima, :okinawa]
  belongs_to :category
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :price, numericality: :only_integer, presence: true
  validates :detail, length: {maximum: 1000 }, presence: true
  validates :name, length: {maximum: 40 }, presence: true
  validates :category_id, presence: true
  validates :status, presence: true
  validates :shipping_area, presence: true
  validates :estimated_date, presence: true
  validates :postage, presence: true
  # validates :image_id, presence: true
  def previous
    user.products.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.products.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

end
