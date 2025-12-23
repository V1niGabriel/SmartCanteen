class Sessao
  # Variável de classe (o @ indica que pertence à classe Sessao, não a uma instância)
  @usuario_atual = nil

  # Método para salvar o usuário (Set)
  def self.iniciar(usuario)
    @usuario_atual = usuario
  end

  # Método para recuperar os dados (Get)
  def self.atual
    @usuario_atual
  end

  # Verifica se tem alguém logado
  def self.logado?
    !@usuario_atual.nil?
  end

  # Limpa a sessão (Logout)
  def self.limpar
    @usuario_atual = nil
  end
end