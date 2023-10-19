class NewsLetter < ApplicationRecord
  has_and_belongs_to_many :colleges
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :hostels

  before_save :post_no_increase

  def post_no_increase
    self.post_no = self.id
  end

end
