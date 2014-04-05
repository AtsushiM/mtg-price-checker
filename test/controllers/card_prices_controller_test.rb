require 'test_helper'

class CardPricesControllerTest < ActionController::TestCase
  setup do
    @card_price = card_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_price" do
    assert_difference('CardPrice.count') do
      post :create, card_price: { price: @card_price.price, time: @card_price.time }
    end

    assert_redirected_to card_price_path(assigns(:card_price))
  end

  test "should show card_price" do
    get :show, id: @card_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_price
    assert_response :success
  end

  test "should update card_price" do
    patch :update, id: @card_price, card_price: { price: @card_price.price, time: @card_price.time }
    assert_redirected_to card_price_path(assigns(:card_price))
  end

  test "should destroy card_price" do
    assert_difference('CardPrice.count', -1) do
      delete :destroy, id: @card_price
    end

    assert_redirected_to card_prices_path
  end
end
