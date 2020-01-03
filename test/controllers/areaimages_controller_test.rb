require 'test_helper'

class AreaimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @areaimage = areaimages(:one)
  end

  test "should get index" do
    get areaimages_url
    assert_response :success
  end

  test "should get new" do
    get new_areaimage_url
    assert_response :success
  end

  test "should create areaimage" do
    assert_difference('Areaimage.count') do
      post areaimages_url, params: { areaimage: { area_id: @areaimage.area_id, areaimage: @areaimage.areaimage } }
    end

    assert_redirected_to areaimage_url(Areaimage.last)
  end

  test "should show areaimage" do
    get areaimage_url(@areaimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_areaimage_url(@areaimage)
    assert_response :success
  end

  test "should update areaimage" do
    patch areaimage_url(@areaimage), params: { areaimage: { area_id: @areaimage.area_id, areaimage: @areaimage.areaimage } }
    assert_redirected_to areaimage_url(@areaimage)
  end

  test "should destroy areaimage" do
    assert_difference('Areaimage.count', -1) do
      delete areaimage_url(@areaimage)
    end

    assert_redirected_to areaimages_url
  end
end
