class User < ApplicationRecord
  validates :user_id, presence: true, length: { maximum: 50 }
  validates :user_name, presence: true, length: { maximum: 50, minimum: 5 }

  has_secure_password
end
