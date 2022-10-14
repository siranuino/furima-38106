class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :defrayment
  belongs_to :area
  belongs_to :deliverytime

  validates :image,           presence: true
  validates :title,           presence: true, length: {maximum: 40}
  validates :explanation,     presence: true, length: {maximum: 1000}
  validates :category_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id,    numericality: { other_than: 1, message: "can't be blank"}
  validates :defrayment_id,   numericality: { other_than: 1, message: "can't be blank"}
  validates :area_id,         numericality: { other_than: 1, message: "can't be blank"}
  validates :deliverytime_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price,           presence: true, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end