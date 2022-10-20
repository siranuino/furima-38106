class OrderMailingAddress

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id

  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id,  presence: true, numericality: { other_than: 1 }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
   # 購入者の情報の保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の保存
    MailingAddress.create(post_code: post_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end