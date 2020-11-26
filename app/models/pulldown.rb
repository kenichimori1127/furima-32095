class Pulldown < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :guideline

  validates :category_id,      numericality: { other_than: 1 }
  validates :status_id,        numericality: { other_than: 1 }
  validates :burden_id,        numericality: { other_than: 1 }
  validates :area_id,          numericality: { other_than: 1 }
  validates :guideline_id,     numericality: { other_than: 1 }
end
