require 'test_helper'

class TesttypesControllerTest < ActionController::TestCase
  setup do
    @testtype = testtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testtype" do
    assert_difference('Testtype.count') do
      post :create, testtype: { coursetype: @testtype.coursetype, description: @testtype.description, title: @testtype.title }
    end

    assert_redirected_to testtype_path(assigns(:testtype))
  end

  test "should show testtype" do
    get :show, id: @testtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testtype
    assert_response :success
  end

  test "should update testtype" do
    put :update, id: @testtype, testtype: { coursetype: @testtype.coursetype, description: @testtype.description, title: @testtype.title }
    assert_redirected_to testtype_path(assigns(:testtype))
  end

  test "should destroy testtype" do
    assert_difference('Testtype.count', -1) do
      delete :destroy, id: @testtype
    end

    assert_redirected_to testtypes_path
  end
end
