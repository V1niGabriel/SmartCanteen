require 'digest'

class Funcionario < Pessoa
  attr_accessor :telefone, :cpf, :cargo, :senha_hash

  def initialize(nome, cpf, telefone, cargo_id, senha)
    super(nome) #chama o initialize da classe pessoa para setar nome e id
    @cpf = cpf
    @telefone = telefone
    @cargo_id = cargo_id
    @senha_hash = Digest::SHA256.hexdigest(senha)
  end

  def salvar(db)
    begin
      query = "INSERT INTO funcionarios (nome, CPF, telefone, cargos_idcargos, senha_hash) VALUES (?, ?, ?, ?, ?)"
      db.execute(query, [@nome, @cpf, @telefone, @cargo_id, @senha_hash])
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

  def getcargos()
    begin
      cargos = DB.execute("SELECT * FROM cargos")
      cargos.each_slice(3) do |grupo|
      grupo.each do |cargo|
        printf("| ID: %-2s - %-25s ", cargo['idcargos'], cargo['nome_cargo'][0..24])  
      end
      puts "|" 
    end
    rescue SQLite3::Exception => e
      puts "Erro ao buscar cargos: #{e.message}"
    end
  end
end