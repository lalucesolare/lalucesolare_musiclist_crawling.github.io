require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get chart" do
    get :chart
    assert_response :success
  end

  test "should get article" do
    get :article
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get forgot_password" do
    get :forgot_password
    assert_response :success
  end

  test "should get navbar" do
    get :navbar
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get table" do
    get :table
    assert_response :success
  end

end
