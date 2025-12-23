require 'digest'
require_relative '../config/path'

def login(cpf, senha)
  senha_hash = Digest::SHA256.hexdigest(senha)
  
  sql = "SELECT f.id, f.nome, c.nome_cargo as cargo
         FROM funcionarios f 
         JOIN cargos c ON f.cargos_idcargos = c.idcargos 
         WHERE f.CPF = ? AND f.senha_hash = ?"

  funcionario = DB.get_first_row(sql, [cpf, senha_hash])

  if funcionario
    Sessao.iniciar(funcionario)
    return true # Retorna apenas sucesso
  else
    return false # Falha
  end
end

def logout()
  Sessao.limpar
end