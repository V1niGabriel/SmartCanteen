class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :funcionario

  has_many :itens_da_venda
  has_many :produto, through: :itens_da_venda
end
