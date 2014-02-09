require 'test_helper'

class PresentationsControllerTest < ActionController::TestCase
  setup do
    @presentation = presentations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presentations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presentation" do
    assert_difference('Presentation.count') do
      post :create, presentation: { day_id: @presentation.day_id, login: @presentation.login, notice: @presentation.notice, student: @presentation.student, theme: @presentation.theme }
    end

    assert_redirected_to presentation_path(assigns(:presentation))
  end

  test "should show presentation" do
    get :show, id: @presentation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presentation
    assert_response :success
  end

  test "should update presentation" do
    put :update, id: @presentation, presentation: { day_id: @presentation.day_id, login: @presentation.login, notice: @presentation.notice, student: @presentation.student, theme: @presentation.theme }
    assert_redirected_to presentation_path(assigns(:presentation))
  end

  test "should destroy presentation" do
    assert_difference('Presentation.count', -1) do
      delete :destroy, id: @presentation
    end

    assert_redirected_to presentations_path
  end
end
