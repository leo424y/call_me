require 'test_helper'

class UxersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uxer = uxers(:one)
  end

  test "should get index" do
    get uxers_url, as: :json
    assert_response :success
  end

  test "should create uxer" do
    assert_difference('Uxer.count') do
      post uxers_url, params: { uxer: { last_time: @uxer.last_time, pub: @uxer.pub, uid: @uxer.uid } }, as: :json
    end

    assert_response 201
  end

  test "should show uxer" do
    get uxer_url(@uxer), as: :json
    assert_response :success
  end

  test "should update uxer" do
    patch uxer_url(@uxer), params: { uxer: { last_time: @uxer.last_time, pub: @uxer.pub, uid: @uxer.uid } }, as: :json
    assert_response 200
  end

  test "should destroy uxer" do
    assert_difference('Uxer.count', -1) do
      delete uxer_url(@uxer), as: :json
    end

    assert_response 204
  end
end
