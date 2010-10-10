require 'test_helper'

class BbqsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bbqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bbq" do
    assert_difference('Bbq.count') do
      post :create, :bbq => { }
    end

    assert_redirected_to bbq_path(assigns(:bbq))
  end

  test "should show bbq" do
    get :show, :id => bbqs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bbqs(:one).to_param
    assert_response :success
  end

  test "should update bbq" do
    put :update, :id => bbqs(:one).to_param, :bbq => { }
    assert_redirected_to bbq_path(assigns(:bbq))
  end

  test "should destroy bbq" do
    assert_difference('Bbq.count', -1) do
      delete :destroy, :id => bbqs(:one).to_param
    end

    assert_redirected_to bbqs_path
  end
end
