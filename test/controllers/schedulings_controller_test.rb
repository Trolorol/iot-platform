require "test_helper"

class SchedulingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduling = schedulings(:one)
  end

  test "should get index" do
    get schedulings_url
    assert_response :success
  end

  test "should get new" do
    get new_scheduling_url
    assert_response :success
  end

  test "should create scheduling" do
    assert_difference("Scheduling.count") do
      post schedulings_url, params: { scheduling: { account_id: @scheduling.account_id, device_id: @scheduling.device_id, group_id: @scheduling.group_id, schedule_time: @scheduling.schedule_time } }
    end

    assert_redirected_to scheduling_url(Scheduling.last)
  end

  test "should show scheduling" do
    get scheduling_url(@scheduling)
    assert_response :success
  end

  test "should get edit" do
    get edit_scheduling_url(@scheduling)
    assert_response :success
  end

  test "should update scheduling" do
    patch scheduling_url(@scheduling), params: { scheduling: { account_id: @scheduling.account_id, device_id: @scheduling.device_id, group_id: @scheduling.group_id, schedule_time: @scheduling.schedule_time } }
    assert_redirected_to scheduling_url(@scheduling)
  end

  test "should destroy scheduling" do
    assert_difference("Scheduling.count", -1) do
      delete scheduling_url(@scheduling)
    end

    assert_redirected_to schedulings_url
  end
end
