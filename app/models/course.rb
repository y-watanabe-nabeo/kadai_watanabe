class Course < ApplicationRecord
  self.table_name = :course
  self.primary_key = :course_id

  validates :course_id, uniqueness: true, presence: true
  validates :course_title, presence: true
  validates :price, numericality: :only_integer, presence: true
  validates :level_id, numericality: :only_integer, presence: true
end
