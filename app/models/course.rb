class Course < ApplicationRecord
  has_many :student_courses                       # <- plural
  has_many :students, through: :student_courses   # <- plural

  validates :short_name,  presence: true, length: { minimum:  3, maximum:  15 } 
  validates :name,        presence: true, length: { minimum:  5, maximum:  50 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 300 } 

end