require 'test_helper'

class ItemstablesControllerTest < ActionController::TestCase
  setup do
    @itemstable = itemstables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itemstables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itemstable" do
    assert_difference('Itemstable.count') do
      post :create, itemstable: { price_per_line: @itemstable.price_per_line, quantity: @itemstable.quantity }
    end

    assert_redirected_to itemstable_path(assigns(:itemstable))
  end

  test "should show itemstable" do
    get :show, id: @itemstable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itemstable
    assert_response :success
  end

  test "should update itemstable" do
    put :update, id: @itemstable, itemstable: { price_per_line: @itemstable.price_per_line, quantity: @itemstable.quantity }
    assert_redirected_to itemstable_path(assigns(:itemstable))
  end

  test "should destroy itemstable" do
    assert_difference('Itemstable.count', -1) do
      delete :destroy, id: @itemstable
    end

    assert_redirected_to itemstables_path
  end
end
