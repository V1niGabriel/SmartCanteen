class Funcionario < ApplicationRecord
  has_many :vendas
  belongs_to :cargo
end
