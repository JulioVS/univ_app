class StudentCourse < ApplicationRecord
  belongs_to :student   # <- singular!
  belongs_to :course    # <- singular!
end