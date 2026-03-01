# db/seeds.rb

puts "Limpando Permissões e Cargos antigos (opcional, mas recomendado para evitar duplicatas)..."
CargoPermissao.destroy_all
Permissao.destroy_all

puts "Gerando Permissões Dinamicamente..."

# 1. Permissão Suprema (Acesso a Tudo)
Permissao.find_or_create_by!(acao: 'manage', tabela: 'all')

# 2. Permissões Específicas para cada Modelo
modelos_do_sistema = ['Produto', 'Venda', 'Cliente', 'Funcionario', 'Cargo']
acoes = ['read', 'create', 'update', 'destroy']

modelos_do_sistema.each do |modelo|
  acoes.each do |acao|
    Permissao.find_or_create_by!(acao: acao, tabela: modelo)
  end
end
puts "✅ #{Permissao.count} Permissões criadas com sucesso no banco!"

puts "Criando Cargos Iniciais..."
cargo_gerente = Cargo.find_or_create_by!(nome_cargo: "Gerente")
cargo_atendente = Cargo.find_or_create_by!(nome_cargo: "Atendente")

puts "Vinculando Permissões aos Cargos..."

# O Gerente ganha a permissão 'manage all' (acesso total)
permissao_total = Permissao.find_by(acao: 'manage', tabela: 'all')
CargoPermissao.find_or_create_by!(cargo: cargo_gerente, permissao: permissao_total)

# O Atendente ganha permissões limitadas (ex: só pode ler e criar vendas, e ler produtos/clientes)
permissoes_atendente = [
  Permissao.find_by(acao: 'read', tabela: 'Produto'),
  Permissao.find_by(acao: 'read', tabela: 'Cliente'),
  Permissao.find_by(acao: 'read', tabela: 'Venda'),
  Permissao.find_by(acao: 'create', tabela: 'Venda')
]

permissoes_atendente.each do |permissao|
  CargoPermissao.find_or_create_by!(cargo: cargo_atendente, permissao: permissao) if permissao
end

puts "✅ Cargos configurados!"

puts "Criando usuário padrão de Gerente..."
Funcionario.find_or_create_by!(cpf: "11111111111") do |f|
  f.nome = "Gerente Padrão"
  f.telefone = "11111111111"
  f.cargo = cargo_gerente
  f.password = "123456"
end
puts "✅ Usuário padrão configurado (CPF: 11111111111 / Senha: 123456)"

puts "Seed finalizado com sucesso! 🎉"
