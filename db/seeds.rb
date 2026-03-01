# Cria o cargo Administrador
cargo_admin = Cargo.find_or_create_by!(nome_cargo: "Administrador")

# Cria o funcionário admin com CPF 11111111111 e senha 123456
Funcionario.find_or_create_by!(cpf: "11111111111") do |f|
  f.nome = "Admin"
  f.telefone = "11111111111"
  f.cargo = cargo_admin
  f.password = "123456"
end

puts "Seed concluído! Admin criado com CPF: 11111111111 e senha: 123456"
