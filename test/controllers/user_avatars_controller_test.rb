require 'test_helper'

class UserAvatarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_avatar = user_avatars(:one)
  end

  test "should get index" do
    get user_avatars_url
    assert_response :success
  end

  test "should get new" do
    get new_user_avatar_url
    assert_response :success
  end

  test "should create user_avatar" do
    assert_difference('UserAvatar.count') do
      post user_avatars_url, params: { user_avatar: { avatar: @user_avatar.avatar, user_id: @user_avatar.user_id } }
    end

    assert_redirected_to user_avatar_url(UserAvatar.last)
  end

  test "should show user_avatar" do
    get user_avatar_url(@user_avatar)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_avatar_url(@user_avatar)
    assert_response :success
  end

  test "should update user_avatar" do
    patch user_avatar_url(@user_avatar), params: { user_avatar: { avatar: @user_avatar.avatar, user_id: @user_avatar.user_id } }
    assert_redirected_to user_avatar_url(@user_avatar)
  end

  test "should destroy user_avatar" do
    assert_difference('UserAvatar.count', -1) do
      delete user_avatar_url(@user_avatar)
    end

    assert_redirected_to user_avatars_url
  end
end
