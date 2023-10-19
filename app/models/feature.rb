class Feature < ApplicationRecord
	has_and_belongs_to_many :colleges
	has_and_belongs_to_many :schools
end
