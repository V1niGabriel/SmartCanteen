class Cargo < ApplicationRecord
  has_many :funcionarios

  validates :nome_cargo, presence: true, uniqueness: true
end
