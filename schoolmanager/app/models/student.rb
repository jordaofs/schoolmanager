class Student < ApplicationRecord
  validates :name, :age, :cpf, :email, presence: true
end