class Pet < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :gender

  with_options presence: true do
    validates :name
    validates :information
    validates :pet_kind
    validates :gender_id, numericality: { other_than: 1 }
  end
end
