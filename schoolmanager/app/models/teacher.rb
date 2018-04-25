class Teacher < ApplicationRecord
  validates :name, :age, :cpf, :email, presence: true
end