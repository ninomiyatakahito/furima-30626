FactoryBot.define do
  factory :purchase_address do
    post_code                   { '250-0112' }
    prefecture_id               { 2 }
    city                        { '横浜市' }
    street                      { '神奈川1-1-1' }
    phone_number                { '08011111111' }
  end
end
