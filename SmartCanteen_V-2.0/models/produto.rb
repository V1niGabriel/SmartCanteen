class Produto
  attr_accessor :id, :nome, :tipo, :preco

  def initialize(nome, tipo, preco, id = nil)
    @nome = nome
    @tipo = tipo
    @preco = preco
    @id = id
  end

  # Método de Classe (Estático) para salvar
  def self.salvar(produto, db_connection)
    begin
      db_connection.execute("INSERT INTO produtos (nome, tipo, preco) VALUES (?, ?, ?)", 
        [produto.nome, produto.tipo, produto.preco])

      #Retorna true ao funcionar
      return true
    rescue SQLite3::Exception => e
      puts "Erro ao salvar no banco: #{e.message}"
      retur false
    end
  end
  
  # Método para buscar todos e retornar OBJETOS, não hash do banco
  def self.todos(db_connection)
    rows = db_connection.execute("SELECT * FROM produtos")
    rows.map do |row|
      Produto.new(row['nome'], row['tipo'], row['preco'], row['id'])
    end
  end

  def self.buscar_por_id(id, db)
    row = db.get_first_row("SELECT * FROM produtos WHERE id = ?", [id])
    return row ? Produto.new(row['nome'], row['tipo'], row['preco'], row['id']) : nil
  end
end