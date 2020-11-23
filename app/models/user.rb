class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items,  dependent: :destroy
  has_many :orders, dependent: :destroy

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,                 presence: true
  # ,format: {with: VALID_EMAIL_REGEX, allow_blank: true}
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :encrypted_password,    presence: true
  # , format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,              presence: true
  validates :first_name,            presence: true
  validates :family_name,           presence: true
  validates :first_name_kana,       presence: true
  validates :family_name_kana,      presence: true
  validates :birth_date,            presence: true

end
