class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
validates :email,           
validates :password,        
    with_options presence: true do
      validates :nickname
      validates :first_name,       
      validates :last_name,        
      validates :first_name_kana, 
      validates :last_name_kana,   
      validates :birthday
    end

  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy
end

