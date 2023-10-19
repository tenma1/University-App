class School < ApplicationRecord

	# VALID_MEDIUMS = ['Hindi', 'English', 'Other']

	validates :name, presence: true
	validates :rating, presence: true, length: { in: 0..10 }
	# validates :medium, presence: false, inclusion: { in: VALID_MEDIUMS }
	validates :medium, presence: true
	validates :affiliation, presence: true
	validates :address, presence: true, length: { maximum: 500 }
	validates :city, presence: true, length: { maximum: 25 }
	validates :pincode, presence: true, length: { is: 6 }

	has_and_belongs_to_many :features
	has_many :hostels, as: :residable
	accepts_nested_attributes_for :hostels, :reject_if => :all_blank, :allow_destroy => true
	has_one :gallery, as: :imageable
	accepts_nested_attributes_for :gallery, reject_if: :all_blank, allow_destroy: true
	has_many :users
	has_many :courses, as: :teachable
	has_and_belongs_to_many :news_letters
	
end
