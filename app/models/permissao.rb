class Permissao < ApplicationRecord
  has_many :cargo_permissoes, dependent: :destroy
  has_many :cargos, through: :cargo_permissoes
end
