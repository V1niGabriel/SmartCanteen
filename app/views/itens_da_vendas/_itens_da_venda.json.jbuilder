json.extract! itens_da_venda, :id, :quantidade, :created_at, :updated_at
json.url itens_da_venda_url(itens_da_venda, format: :json)
