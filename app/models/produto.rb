class Produto < ApplicationRecord
  has_many :itens_da_venda
  has_many :vendas, through: :itens_da_venda

  validates :nome, presence: true
  validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :tipo, presence: true
end
