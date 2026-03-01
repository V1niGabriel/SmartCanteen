class CargoPermissao < ApplicationRecord
  belongs_to :cargo
  belongs_to :permissao
end
