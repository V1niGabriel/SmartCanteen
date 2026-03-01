class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :funcionario

  has_many :itens_da_venda
  has_many :produtos, through: :itens_da_venda

  validates :data_da_compra, presence: true
end
