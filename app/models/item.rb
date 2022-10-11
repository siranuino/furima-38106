class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,           presence: true
  validates :title,           presence: true
  validates :explanation,     presence: true
  validates :category_id,     presence: true
  validates :condition_id,    presence: true
  validates :defrayment_id,   presence: true
  validates :area_id,         presence: true
  validates :deliverytime_id, presence: true
  validates :price,           presence: true
  validates :user,            presence: true
end
