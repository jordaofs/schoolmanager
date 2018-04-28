class SubjectTeacher < ActiveRecord::Base
  self.table_name = "subjects_teachers"
  belongs_to :subject
  belongs_to :teacher
end