require 'test_helper'

class LinkElemsControllerTest < ActionController::TestCase
  setup do
    @link_elem = link_elems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_elems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_elem" do
    assert_difference('LinkElem.count') do
      post :create, :link_elem => @link_elem.attributes
    end

    assert_redirected_to link_elem_path(assigns(:link_elem))
  end

  test "should show link_elem" do
    get :show, :id => @link_elem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @link_elem.to_param
    assert_response :success
  end

  test "should update link_elem" do
    put :update, :id => @link_elem.to_param, :link_elem => @link_elem.attributes
    assert_redirected_to link_elem_path(assigns(:link_elem))
  end

  test "should destroy link_elem" do
    assert_difference('LinkElem.count', -1) do
      delete :destroy, :id => @link_elem.to_param
    end

    assert_redirected_to link_elems_path
  end
end
