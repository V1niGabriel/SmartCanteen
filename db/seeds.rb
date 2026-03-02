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

puts "\n"
puts "=========================================================="
puts "GERAÇÃO DE DADOS DE EXEMPLO (AMOSTRAGEM PARA O DASHBOARD)"
puts "=========================================================="
puts "Gerando 4 Produtos incríveis..."

produtos_exemplo = [
  { nome: "Coxinha de Frango", preco: 5.50, tipo: "Salgado" },
  { nome: "Coca-Cola Lata", preco: 4.00, tipo: "Bebida" },
  { nome: "Cheesecake de Morango", preco: 8.50, tipo: "Doce" },
  { nome: "Sanduíche Natural", preco: 7.00, tipo: "Lanche" }
].map { |p| Produto.find_or_create_by!(nome: p[:nome]) { |prod| prod.preco = p[:preco]; prod.tipo = p[:tipo] } }

puts "Gerando 15 Clientes..."
clientes_exemplo = []
15.times do |i|
  clientes_exemplo << Cliente.find_or_create_by!(nome: "Cliente Exemplo #{i + 1}")
end

puts "Gerando 4 Funcionários (Atendentes)..."
funcionarios_exemplo = []
4.times do |i|
  cpf_falso = "222222222#{i.to_s.rjust(2, '0')}"
  funcionarios_exemplo << Funcionario.find_or_create_by!(cpf: cpf_falso) do |f|
    f.nome = "Atendente Exemplo #{i + 1}"
    f.telefone = "719#{rand(10000000..99999999)}"
    f.cargo = cargo_atendente
    f.password = "123456"
  end
end

puts "Gerando 223 Vendas espalhadas pelo último mês (Isso vai popular o Gráfico!)..."
223.times do
  # Sorteia um dia nos últimos 30 dias (deixando a hora aleatória durante o expediente comercial)
  data_aleatoria = rand(1..30).days.ago.change(hour: rand(8..18), min: rand(0..59))
  
  venda = Venda.create!(
    cliente: clientes_exemplo.sample,
    funcionario: funcionarios_exemplo.sample, # Usando apenas os atendentes do loop, excluindo o gerente
    data_da_compra: data_aleatoria
  )

  # Adiciona de 1 a 4 itens variados nesta venda
  rand(1..4).times do
    produto_sorteado = produtos_exemplo.sample
    ItensDaVenda.create!(
      venda: venda,
      produto: produto_sorteado,
      quantidade: rand(1..3), # De 1 a 3 unidades do mesmo produto
      precounitario: produto_sorteado.preco
    )
  end
end

puts "✅ Amostragem de Vendas, Funcionários, Produtos e Clientes concluída com sucesso!"
puts "\nSeed finalizado de forma estrutural e populacional! 🎉"
