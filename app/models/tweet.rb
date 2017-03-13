class Tweet < ApplicationRecord
  belongs_to :user

  validates :message, presence: true, length: { maximum: 140, too_long: 'A tweet is only 140 characters max.'}
  has_many :tweets

  has_many :likes


end
