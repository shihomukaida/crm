class Customer < ActiveRecord::Base
  belongs_to :company

  # company_idの以下の２行を追加
  validates :company_id, presence: true,
    length: { maximum: 20 }
  validates :family_name, presence: true,
    length: { maximum: 20 }
  validates :given_name, presence: true,
    length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  def full_name
    full_name = family_name  + given_name + '様'
    return full_name
  end
end
