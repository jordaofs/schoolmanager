class Subject < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :degrees, optional: true
  has_and_belongs_to_many :teachers, optional: true
end