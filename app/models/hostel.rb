class Hostel < ApplicationRecord

  has_many :users
  
  VALID_RESIDENTIAL_TYPES = ['Co-Ed', 'Boys', 'Girls']

  validates :name, presence: true
  validates :capacity, presence: true, numericality: { in: 100..500 }
  validates :residential_type, presence: true, inclusion: { in: VALID_RESIDENTIAL_TYPES }

  belongs_to :residable, polymorphic: true
  has_and_belongs_to_many :facilities
  has_one :gallery, as: :imageable
  accepts_nested_attributes_for :gallery, reject_if: :all_blank, allow_destroy: true
  has_and_belongs_to_many :news_letters


end