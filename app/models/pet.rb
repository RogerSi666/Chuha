class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :information,　:pettype, presence: true
  validates :gender_id, numericality: { other_than: 1 }, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
