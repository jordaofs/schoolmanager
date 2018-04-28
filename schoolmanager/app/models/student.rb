class Student < ApplicationRecord
  validates :name, :age, :cpf, :email, presence: true
  belongs_to :degree, optional: true
end