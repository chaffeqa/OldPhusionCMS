require 'test_helper'

class BlogElemsControllerTest < ActionController::TestCase
  setup do
    @blog_elem = blog_elems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_elems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_elem" do
    assert_difference('BlogElem.count') do
      post :create, :blog_elem => @blog_elem.attributes
    end

    assert_redirected_to blog_elem_path(assigns(:blog_elem))
  end

  test "should show blog_elem" do
    get :show, :id => @blog_elem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @blog_elem.to_param
    assert_response :success
  end

  test "should update blog_elem" do
    put :update, :id => @blog_elem.to_param, :blog_elem => @blog_elem.attributes
    assert_redirected_to blog_elem_path(assigns(:blog_elem))
  end

  test "should destroy blog_elem" do
    assert_difference('BlogElem.count', -1) do
      delete :destroy, :id => @blog_elem.to_param
    end

    assert_redirected_to blog_elems_path
  end
end
