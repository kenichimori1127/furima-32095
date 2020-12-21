class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items,  dependent: :destroy
  has_many :orders, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英文字で入力してください',allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角文字で入力してください',allow_blank: true }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角文字で入力してください',allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角文字で入力してください',allow_blank: true }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角文字で入力してください',allow_blank: true }
    validates :birth_date
  end
end
