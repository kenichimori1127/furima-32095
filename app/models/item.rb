class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation
    validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}

    validates :price, numericality:{ with: /\A[0-9]+\z/, message: "Half-width number"}
      with_options numericality:{ other_than: 1, message: "select"} do
        validates :category_id
        validates :status_id
        validates :burden_id
        validates :area_id
        validates :guideline_id
    end
  end
end
