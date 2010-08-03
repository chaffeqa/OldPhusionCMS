require 'test_helper'

class PhotoGalleryElemsControllerTest < ActionController::TestCase
  setup do
    @photo_gallery_elem = photo_gallery_elems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_gallery_elems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_gallery_elem" do
    assert_difference('PhotoGalleryElem.count') do
      post :create, :photo_gallery_elem => @photo_gallery_elem.attributes
    end

    assert_redirected_to photo_gallery_elem_path(assigns(:photo_gallery_elem))
  end

  test "should show photo_gallery_elem" do
    get :show, :id => @photo_gallery_elem.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @photo_gallery_elem.to_param
    assert_response :success
  end

  test "should update photo_gallery_elem" do
    put :update, :id => @photo_gallery_elem.to_param, :photo_gallery_elem => @photo_gallery_elem.attributes
    assert_redirected_to photo_gallery_elem_path(assigns(:photo_gallery_elem))
  end

  test "should destroy photo_gallery_elem" do
    assert_difference('PhotoGalleryElem.count', -1) do
      delete :destroy, :id => @photo_gallery_elem.to_param
    end

    assert_redirected_to photo_gallery_elems_path
  end
end
