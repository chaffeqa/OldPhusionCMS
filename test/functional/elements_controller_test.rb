require 'test_helper'

class ElementsControllerTest < ActionController::TestCase
  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "should get move" do
    get :move
    assert_response :success
  end

end
