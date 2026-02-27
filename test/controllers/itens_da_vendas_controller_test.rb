require "test_helper"

class ItensDaVendasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itens_da_venda = itens_da_vendas(:one)
  end

  test "should get index" do
    get itens_da_vendas_url
    assert_response :success
  end

  test "should get new" do
    get new_itens_da_venda_url
    assert_response :success
  end

  test "should create itens_da_venda" do
    assert_difference("ItensDaVenda.count") do
      post itens_da_vendas_url, params: { itens_da_venda: { quantidade: @itens_da_venda.quantidade } }
    end

    assert_redirected_to itens_da_venda_url(ItensDaVenda.last)
  end

  test "should show itens_da_venda" do
    get itens_da_venda_url(@itens_da_venda)
    assert_response :success
  end

  test "should get edit" do
    get edit_itens_da_venda_url(@itens_da_venda)
    assert_response :success
  end

  test "should update itens_da_venda" do
    patch itens_da_venda_url(@itens_da_venda), params: { itens_da_venda: { quantidade: @itens_da_venda.quantidade } }
    assert_redirected_to itens_da_venda_url(@itens_da_venda)
  end

  test "should destroy itens_da_venda" do
    assert_difference("ItensDaVenda.count", -1) do
      delete itens_da_venda_url(@itens_da_venda)
    end

    assert_redirected_to itens_da_vendas_url
  end
end
