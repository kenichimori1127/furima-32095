class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :guideline

  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation
      with_options numericality: { other_than: 1, message: 'を選択してください' } do
        validates :category_id
        validates :status_id
        validates :burden_id
        validates :area_id
        validates :guideline_id
      end
    validates :price, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, allow_blank: true }
  end
end
