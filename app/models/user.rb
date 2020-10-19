class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email,                 format: { with: /@/}
         validates :password,         length: { minimum: 6 }, confirmation: true,  format: { with: /\A[a-zA-Z0-9]+\z/ }
      with_options presence: true do
         validates :password_confirmation
         validates :nickname
         validates :first_name,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :last_name,        format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
         validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/}
         validates :last_name_kana,   format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthday
      end

  has_many :items, dependent: :destroy
  has_many :purchases, dependent: :destroy
end