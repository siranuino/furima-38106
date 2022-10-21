class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :mailing_address
end
