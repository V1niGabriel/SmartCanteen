class Cargo < ApplicationRecord
  has_many :funcionarios
  has_many :cargo_permissoes, dependent: :destroy
  has_many :permissoes, through: :cargo_permissoes

  validates :nome_cargo, presence: true, uniqueness: true
end
