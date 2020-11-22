class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items,  dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :email,                 presence: true #空の場合はDBに保存しない
  validates :encrypted_password,    presence: true #空の場合はDBに保存しない
  validates :nickname,              presence: true #空の場合はDBに保存しない
  validates :first_name,            presence: true #空の場合はDBに保存しない
  validates :family_name,           presence: true #空の場合はDBに保存しない
  validates :first_name_kana,       presence: true #空の場合はDBに保存しない
  validates :family_name_kana,      presence: true #空の場合はDBに保存しない
  validates :birth_date,            presence: true #空の場合はDBに保存しない
end
