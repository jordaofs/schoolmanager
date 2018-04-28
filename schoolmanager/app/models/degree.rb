class Degree < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :teachers
  has_many :students

  accepts_nested_attributes_for :subjects, reject_if: :all_blank, allow_destroy: true
end