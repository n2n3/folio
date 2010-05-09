require 'test_helper'

class ImgsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create img" do
    assert_difference('Img.count') do
      post :create, :img => imgs(:one).attributes
    end

    assert_redirected_to img_path(assigns(:img))
  end

  test "should show img" do
    get :show, :id => imgs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => imgs(:one).to_param
    assert_response :success
  end

  test "should update img" do
    put :update, :id => imgs(:one).to_param, :img => imgs(:one).attributes
    assert_redirected_to img_path(assigns(:img))
  end

  test "should destroy img" do
    assert_difference('Img.count', -1) do
      delete :destroy, :id => imgs(:one).to_param
    end

    assert_redirected_to imgs_path
  end
end
