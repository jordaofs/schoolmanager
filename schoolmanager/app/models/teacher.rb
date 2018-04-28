class Teacher < ApplicationRecord
  validates :name, :age, :cpf, :email, presence: true
  has_and_belongs_to_many :degrees, optional: true
end