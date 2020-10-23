class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shopping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shopping_days
  has_one_attached :image
  belongs_to :user
  validates :name, :description, :category_id, :condition_id,
            :shopping_cost_id, :prefecture_id, :shopping_days_id, :price, :image, presence: true
  validates :category_id, :condition_id, :shopping_cost_id, :prefecture_id, :shopping_days_id, numericality: { other_than: 0 }
  validates :price,
    numericality: { only_integer: true,
    greater_than: 300, less_than: 9999999
  }
end
