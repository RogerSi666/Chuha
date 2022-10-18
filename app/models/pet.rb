class Pet < ApplicationRecord
 

  validates :name, :information,　:pettype, presence: true

  validates :gender_id, numericality: { other_than: 1 } , presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
