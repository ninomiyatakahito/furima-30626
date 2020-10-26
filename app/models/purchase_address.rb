class PurchaseAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street, :building_name, :phone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end

