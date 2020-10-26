class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string    :post_code,           null: false                  
      t.integer   :prefecture_id,       null: false                  
      t.siring    :city,                null: false                  
      t.siring    :street,              null: false                  
      t.siring    :building_name                                        
      t.siring    :phone_number,        null: false                  
      t.siring    :purchase,            null: false,foreign_key:true 
      t.timestamps
    end
  end
end