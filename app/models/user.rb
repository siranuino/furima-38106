class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/}
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birthday, presence: true
  

end
