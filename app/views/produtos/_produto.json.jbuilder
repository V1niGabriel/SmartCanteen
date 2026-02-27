json.extract! produto, :id, :nome, :tipo, :preco, :created_at, :updated_at
json.url produto_url(produto, format: :json)
