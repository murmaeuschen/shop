require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { credit_card_number: @order.credit_card_number, credit_card_type: @order.credit_card_type, cvv2: @order.cvv2, date_of_ordering: @order.date_of_ordering, delivery_date: @order.delivery_date, expiry_date: @order.expiry_date, issue_number: @order.issue_number, max_discount: @order.max_discount, order_number: @order.order_number, pref_delivery_date: @order.pref_delivery_date, role: @order.role, start_date: @order.start_date, status: @order.status, total_num_of_items: @order.total_num_of_items, total_price: @order.total_price }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order, order: { credit_card_number: @order.credit_card_number, credit_card_type: @order.credit_card_type, cvv2: @order.cvv2, date_of_ordering: @order.date_of_ordering, delivery_date: @order.delivery_date, expiry_date: @order.expiry_date, issue_number: @order.issue_number, max_discount: @order.max_discount, order_number: @order.order_number, pref_delivery_date: @order.pref_delivery_date, role: @order.role, start_date: @order.start_date, status: @order.status, total_num_of_items: @order.total_num_of_items, total_price: @order.total_price }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
