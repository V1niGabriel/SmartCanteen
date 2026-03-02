class HomeController < ApplicationController
  skip_load_and_authorize_resource

  def index
    # 1. Definição do Período (Padrão: Últimos 7 dias)
    if params[:date_range].present?
      # A biblioteca Flatpickr (em PT) usa " até " para separar as datas
      dates = params[:date_range].split(/ até | to /)
      @start_date = Date.parse(dates[0])
      @end_date = dates.length > 1 ? Date.parse(dates[1]) : @start_date
    else
      @start_date = 7.days.ago.to_date
      @end_date = Date.today
    end

    # Escopo base: vendas no período
    vendas_base = Venda.joins(:itens_da_venda)
                       .where(data_da_compra: @start_date.beginning_of_day..@end_date.end_of_day)

    # Filtro de Permisão: Escopo total ou Escopo Pessoal
    if current_ability.can?(:manage, :all)
      @vendas_escudo = vendas_base
    else
      @vendas_escudo = vendas_base.where(funcionario_id: current_funcionario.id)
    end

    # Card 1: Valor Total
    @valor_total_7_dias = @vendas_escudo.sum("itens_da_vendas.quantidade * itens_da_vendas.precounitario") || 0

    # Gráfico: Receita Diária (Agrupado por data no SQLite)
    vendas_por_dia = @vendas_escudo.group("DATE(data_da_compra)").sum("itens_da_vendas.quantidade * itens_da_vendas.precounitario")
    
    # Preencher dias sem vendas com 0
    @receita_diaria = {}
    (@start_date..@end_date).each do |date|
      date_str = date.strftime("%Y-%m-%d")
      @receita_diaria[date_str] = vendas_por_dia[date_str] || 0
    end

    # Card 2: Desempenho por Atendente
    @desempenho_funcionarios = @vendas_escudo
      .group("vendas.funcionario_id")
      .select("vendas.funcionario_id, COUNT(DISTINCT vendas.id) AS total_atendimentos, SUM(itens_da_vendas.quantidade * itens_da_vendas.precounitario) AS total_arrecadado")
      .order("total_arrecadado DESC")

    # Card 3: Ranking de Clientes
    @desempenho_clientes = @vendas_escudo
      .group("vendas.cliente_id")
      .select("vendas.cliente_id, COUNT(DISTINCT vendas.id) AS total_compras, SUM(itens_da_vendas.quantidade * itens_da_vendas.precounitario) AS total_gasto")
      .order("total_gasto DESC")
  end
end
