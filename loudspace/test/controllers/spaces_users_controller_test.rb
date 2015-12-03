require 'test_helper'

class SpacesUsersControllerTest < ActionController::TestCase
  setup do
    @spaces_user = spaces_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spaces_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spaces_user" do
    assert_difference('SpacesUser.count') do
      post :create, spaces_user: {  }
    end

    assert_redirected_to spaces_user_path(assigns(:spaces_user))
  end

  test "should show spaces_user" do
    get :show, id: @spaces_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spaces_user
    assert_response :success
  end

  test "should update spaces_user" do
    patch :update, id: @spaces_user, spaces_user: {  }
    assert_redirected_to spaces_user_path(assigns(:spaces_user))
  end

  test "should destroy spaces_user" do
    assert_difference('SpacesUser.count', -1) do
      delete :destroy, id: @spaces_user
    end

    assert_redirected_to spaces_users_path
  end
end
