class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :item_status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :day

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
  validates :genre_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id,       numericality: { other_than: 1 , message: "can't be blank"}
end
