system("cls")

require_relative 'functions/menu_principal'
require_relative 'functions/utils'

def inicia_sistema()
  opcao = -1
  while opcao != 0
    sep()
    puts "1 - Cadastrar novo Produto"
    puts "2 - Cadastrar novo Cliente"
    puts "3 - Registrar Venda" 
    puts "4 - Relatórios"
    puts "0 - Sair"
    print "Escolha uma opção: "
    opcao = gets.chomp.to_i
    sep()
    

    case opcao
    when 1
      cadastrarProduto()
    when 2
      cadastrarCliente()
    when 3
      registrarVenda()
    when 4
      puts "Entrando no menu de relatórios..."
      menuRelatorios()
    when 0
      puts "Saindo do sistema..."
      sep()
    else
      puts "Opção inválida. Tente novamente."
    end
  end
end
  

def menuRelatorios()
  opcaoRelatorio = -1

  while opcaoRelatorio != 0
    sep()
    puts "Menu de Relatórios"
    puts "1 - Listar Todos os Clientes"
    puts "2 - Listar Todos os Produtos"
    puts "3 - Listar Todas as Vendas"
    puts "4 - Total do valor vendido em um dia específico"
    puts "5 - Produto mais vendido"
    puts "0 - Voltar ao menu principal"
    print "Escolha uma opção: "
    opcaoRelatorio = gets.chomp.to_i
    sep()
    
    case opcaoRelatorio
    when 1
      listarClientes()
    when 2
      listarProdutos()
    when 3
      listarVendas()
    when 4
      puts "Digite uma data no formato DD-MM-AAAA"
      data = gets.chomp
      data_valida = validarData(data)
      totalVendasDia(data_valida)
    when 5
      produtoMaisVendido()
    when 0
      puts "Retornando ao menu principal..."
      return
    else
      puts "Opção inválida. Tente novamente."
    end
  end
end


inicia_sistema()