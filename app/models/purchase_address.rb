class PurchaseAddress < ApplicationRecord
  has_one :address
  has_one :purchase

end
