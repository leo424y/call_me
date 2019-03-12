require 'test_helper'

class CallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @call = calls(:one)
  end

  test "should get index" do
    get calls_url, as: :json
    assert_response :success
  end

  test "should create call" do
    assert_difference('Call.count') do
      post calls_url, params: { call: { audio: @call.audio, content: @call.content, num: @call.num, stamp: @call.stamp } }, as: :json
    end

    assert_response 201
  end

  test "should show call" do
    get call_url(@call), as: :json
    assert_response :success
  end

  test "should update call" do
    patch call_url(@call), params: { call: { audio: @call.audio, content: @call.content, num: @call.num, stamp: @call.stamp } }, as: :json
    assert_response 200
  end

  test "should destroy call" do
    assert_difference('Call.count', -1) do
      delete call_url(@call), as: :json
    end

    assert_response 204
  end
end
