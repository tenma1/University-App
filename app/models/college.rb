class College < ApplicationRecord

	validates :name, presence: true
	validates :rating, presence: true, numericality: { in: 0..10 }
	validates :discipline, presence: true, length: { maximum: 25 }
	validates :address, presence: true, length: { maximum: 500 }
	validates :city, presence: true, length: { maximum: 25 }
	validates :pincode, presence: true, length: { is: 6 }

	has_and_belongs_to_many :features
	has_many :hostels, as: :residable
	accepts_nested_attributes_for :hostels, :reject_if => :all_blank, :allow_destroy => true
	has_one :gallery, as: :imageable, dependent: :destroy
	accepts_nested_attributes_for :gallery, reject_if: :all_blank, allow_destroy: true
	has_many :users
	has_many :courses, as: :teachable
	has_and_belongs_to_many :news_letters

end
