class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,# :invitable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  belongs_to :college, optional: true
  belongs_to :school, optional: true
  belongs_to :hostel, optional: true
  has_and_belongs_to_many :courses
  has_one :accounting, dependent: :destroy
  has_one :academic, dependent: :destroy
  has_one :order, dependent: :destroy
  has_many :receipts

  validates :role, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


  after_create :academic_and_accounting, :welcome_send


  # def send_invite
  #   User.invite!({:email => self.email }, current_admin_user)
  # end

  # limit no of objects in has many associations (User + Courses)
  # validate_on_create :courses_count_within_bounds

  # private

  # def courses_count_within_bounds
  #   if self.role.name.downcase == 'student'
  #     return if courses.blank?
  #     errors.add("Can only select Two courses at max for a sem") if courses.size > 2
  #   end
  # end

  private

  def welcome_send
    UserMailer.welcome_mail(self).deliver_now
  end

  def academic_and_accounting
    if self.role.name != 'Visitor'
      Academic.create!(syllabus: '', att_in_percent: 0, user_id: self.id)
      Accounting.create!(user_id: self.id, total_value: 0, current_due: 0, credited: 0, other_details: '', other_charges: 0, details: '')
    end
  end

end
