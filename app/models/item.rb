class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  validates :product_name, presence: true
  validates :explanation,  presence: true
  validates :price, presence: true, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}

  with_options numericality:{ other_than: 1, message: "select"} do
  validates :category_id,  presence: true
  validates :status_id,    presence: true
  validates :burden_id,    presence: true
  validates :area_id,      presence: true
  validates :guideline_id, presence: true
  end

  validates :image,        presence: true
end
