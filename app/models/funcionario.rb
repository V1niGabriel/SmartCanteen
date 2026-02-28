class Funcionario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable
  has_many :vendas
  belongs_to :cargo

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true, length: { is: 11 },
                  format: { with: /\A\d+\z/, message: "deve conter apenas números" }
  validates :telefone, presence: true, length: { in: 10..11 },
                       format: { with: /\A\d+\z/, message: "deve conter apenas números" }
end
