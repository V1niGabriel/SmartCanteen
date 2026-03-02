# SmartCanteen 🍔

SmartCanteen é uma aplicação desenvolvida com Ruby on Rails para gerenciar cantinas de forma inteligente. O sistema permite controle de vendas, estoque de produtos, cadastro de clientes, além de um robusto sistema de controle de acesso (RBAC) com níveis de permissões configuráveis para os funcionários.

## 🚀 Principais Funcionalidades

- **Autenticação Segura:** Autenticação de usuários usando CPF e senha, implementado com **Devise**.
- **Controle de Acesso Dinâmico (RBAC):** Permissões flexíveis (Criar, Visualizar, Editar, Excluir) utilizando **CanCanCan**.
- **Gestão de Cargos e Funcionários:** Funcionários são atribuídos a cargos que dão direitos dinâmicos a específicas partes do sistema.
- **Vendas e Clientes:** Controle de registro de vendas com produtos e acompanhamento de clientes.
- **Dashboard Interativo:** Exibição de gráficos e resumos das vendas com **Chart.js** e filtro de datas utilizando **Flatpickr**.

## 🛠 Tecnologias Utilizadas

- **Ruby on Rails** (Backend / Fullstack Framework)
- **SQLite3** (Banco de dados padrão desenvolvimento)
- **Devise** (Autenticação)
- **CanCanCan** (Autorização)
- **Chart.js** (Gráficos)
- **Flatpickr** (Date picker)
- Hotwire / Turbo (Interação moderna com Rails)

## ⚙️ Como rodar o projeto localmente

Siga o passo a passo abaixo para rodar o projeto na sua máquina após clonar o repositório.

### Pré-requisitos
- Ruby (>= 3.0 recomendado)
- Rails (>= 7.0 recomendado)
- Node.js & Yarn (se houver build assets via jsbundling/cssbundling)

### Passo a passo

Você pode inicializar o projeto com a seguinte sequência de comandos no seu terminal:

```bash
# Clone o repositório
git clone https://github.com/seu-usuario/SmartCanteen.git
cd SmartCanteen

# Instale as dependências
bundle install

# Rode as migrações e popule com dados de teste
rails db:migrate
rails db:seed

# Inicie o servidor
rails server
```

6. **Acesse no navegador**
   Abra: [http://localhost:3000](http://localhost:3000)

---

## 🔐 Acesso de Teste

A base de dados será hidratada (seeded) com um usuário principal com o cargo de **Gerente** (que tem permissão global de acesso):

| Usuário / CPF | Senha     |
|-------------|-----------|
| 11111111111 | 123456    |

> 💡 Após logar, você já será capaz de gerenciar todas as funcionalidades, editar permissões, adicionar funcionários aos cargos de (Atendente, etc.) e visualizar o gráfico no menu Home/Dashboard.

## 🤝 Contribuindo
Fique à vontade para reportar issues, criar forks e pull requests de melhorias nesse projeto.

---
Desenvolvido com ☕ e Ruby on Rails.
