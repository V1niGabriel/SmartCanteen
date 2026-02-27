class Funcionario < ApplicationRecord
  has_many :venda

  belongs_to :cargo, foreign_key: "cargo_id"
end
