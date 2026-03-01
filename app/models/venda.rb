class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :funcionario

  has_many :itens_da_venda, dependent: :destroy
  has_many :produtos, through: :itens_da_venda

  accepts_nested_attributes_for :itens_da_venda, allow_destroy: true

  validates :data_da_compra, presence: true

  def valor_total
    itens_da_venda.sum { |item| (item.precounitario || 0) * (item.quantidade || 0) }
  end
end
