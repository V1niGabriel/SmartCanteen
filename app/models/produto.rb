class Produto < ApplicationRecord
  has_many :itens_da_venda
  has_many :venda, through: :itens_da_venda
end
