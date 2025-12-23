class Funcionario < Pessoa
  attr_accessor :telefone, :cpf, :cargo

  def initialize(nome, cpf, telefone, cargo_id, id = nil)
    super(nome, id) #chama o initialize da classe pessoa para setar nome e id
    @cpf = cpf
    @telefone = telefone
    @cargo_id = cargo_id
  end

  def salvar(db)
    begin
      query = "INSERT INTO funcionarios (nome, CPF, telefone, cargos_idcargos) VALUES (?, ?, ?, ?)"
      db.execute(query, [@nome, @cpf, @telefone, @cargo_id])
    rescue SQLite3::Exception => e
      puts "Erro ao salvar funcionario: #{e.message}"
    end
  end
end 

class Cargo
  attr_accessor :id, :nome

  def initialize(id, nome)
    @id = id
    @nome = nome
  end
end