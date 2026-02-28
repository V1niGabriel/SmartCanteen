class Cliente < ApplicationRecord
  has_many :vendas

  validates :nome, presence: true
end
