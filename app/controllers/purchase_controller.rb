class PurchaseController < ApplicationController
  before_action :set_product
  require 'payjp'

  def index
    @parents = Category.where(ancestry: nil)
    card = Card.find_by(user_id: current_user.id)
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    amount: @product.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
  )
  @product_buyer= Product.find(params[:product_id])
  @product_buyer.update( buyer_id: current_user.id)
  redirect_to done_product_purchase_index_path(product_id: @product.id) #完了画面に移動
  end
  def done
    @product_buyer= Product.find(params[:product_id])
    @product_buyer.update( buyer_id: current_user.id)
    @parent = Category.where(ancestry: nil)
    @images = Image.where(product_id: @product.id)
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

end