class ItensDaVendasController < ApplicationController
  before_action :set_itens_da_venda, only: %i[ show edit update destroy ]

  # GET /itens_da_vendas or /itens_da_vendas.json
  def index
    @itens_da_vendas = ItensDaVenda.all
  end

  # GET /itens_da_vendas/1 or /itens_da_vendas/1.json
  def show
  end

  # GET /itens_da_vendas/new
  def new
    @itens_da_venda = ItensDaVenda.new
  end

  # GET /itens_da_vendas/1/edit
  def edit
  end

  # POST /itens_da_vendas or /itens_da_vendas.json
  def create
    @itens_da_venda = ItensDaVenda.new(itens_da_venda_params)

    respond_to do |format|
      if @itens_da_venda.save
        format.html { redirect_to @itens_da_venda, notice: "Itens da venda was successfully created." }
        format.json { render :show, status: :created, location: @itens_da_venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @itens_da_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itens_da_vendas/1 or /itens_da_vendas/1.json
  def update
    respond_to do |format|
      if @itens_da_venda.update(itens_da_venda_params)
        format.html { redirect_to @itens_da_venda, notice: "Itens da venda was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @itens_da_venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @itens_da_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens_da_vendas/1 or /itens_da_vendas/1.json
  def destroy
    @itens_da_venda.destroy!

    respond_to do |format|
      format.html { redirect_to itens_da_vendas_path, notice: "Itens da venda was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itens_da_venda
      @itens_da_venda = ItensDaVenda.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def itens_da_venda_params
      params.expect(itens_da_venda: [ :quantidade ])
    end
end
