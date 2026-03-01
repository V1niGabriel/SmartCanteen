class Ability
  include CanCan::Ability

  def initialize(funcionario)
    return unless funcionario.present? && funcionario.cargo.present?

    funcionario.cargo.permissoes.each do |permissao|
      alvo = permissao.tabela == 'all' ? :all : permissao.tabela.constantize
      can permissao.acao.to_sym, alvo

      # Se a pessoa pode fazer algo com Venda, ela também pode fazer com os itens daquela venda
      if alvo == Venda || alvo == :all
        can permissao.acao.to_sym, ItensDaVenda
      end
    end
  end
end
