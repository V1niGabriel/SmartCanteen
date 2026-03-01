class Ability
  include CanCan::Ability

  def initialize(funcionario)
    return unless funcionario.present? && funcionario.cargo.present?

    funcionario.cargo.permissoes.each do |permissao|
      alvo = permissao.tabela == 'all' ? :all : permissao.tabela.constantize
      can permissao.acao.to_sym, alvo
    end
  end
end
