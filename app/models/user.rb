# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :articles

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 3, maximum: 25 }

  validates :email, presence: true, length: { maximum: 105 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
