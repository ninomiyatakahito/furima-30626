class PurchaseAddress < ApplicationRecord
  has_one :address
  has_one :purchase
  validates :prefecture_id, numericality: { other_than: 0 }
end
