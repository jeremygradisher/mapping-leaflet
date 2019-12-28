require 'test_helper'

class MapimagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mapimage = mapimages(:one)
  end

  test "should get index" do
    get mapimages_url
    assert_response :success
  end

  test "should get new" do
    get new_mapimage_url
    assert_response :success
  end

  test "should create mapimage" do
    assert_difference('Mapimage.count') do
      post mapimages_url, params: { mapimage: { height: @mapimage.height, map_id: @mapimage.map_id, map_id: @mapimage.map_id, mapimage: @mapimage.mapimage, width: @mapimage.width } }
    end

    assert_redirected_to mapimage_url(Mapimage.last)
  end

  test "should show mapimage" do
    get mapimage_url(@mapimage)
    assert_response :success
  end

  test "should get edit" do
    get edit_mapimage_url(@mapimage)
    assert_response :success
  end

  test "should update mapimage" do
    patch mapimage_url(@mapimage), params: { mapimage: { height: @mapimage.height, map_id: @mapimage.map_id, map_id: @mapimage.map_id, mapimage: @mapimage.mapimage, width: @mapimage.width } }
    assert_redirected_to mapimage_url(@mapimage)
  end

  test "should destroy mapimage" do
    assert_difference('Mapimage.count', -1) do
      delete mapimage_url(@mapimage)
    end

    assert_redirected_to mapimages_url
  end
end
