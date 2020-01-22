class User < ApplicationRecord
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i #with out the @dasd..com issue

    before_save { self.email = email.downcase } #Required to avoid database inconsisntecies regarding the email (up case- down case matching problems) since validation ignores is case insensitive

    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
    validates :password, length: { minimum: 6 }, presence: true
end
