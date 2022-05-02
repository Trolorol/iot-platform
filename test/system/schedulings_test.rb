require "application_system_test_case"

class SchedulingsTest < ApplicationSystemTestCase
  setup do
    @scheduling = schedulings(:one)
  end

  test "visiting the index" do
    visit schedulings_url
    assert_selector "h1", text: "Schedulings"
  end

  test "should create scheduling" do
    visit schedulings_url
    click_on "New scheduling"

    fill_in "Account", with: @scheduling.account_id
    fill_in "Device", with: @scheduling.device_id
    fill_in "Group", with: @scheduling.group_id
    fill_in "Schedule time", with: @scheduling.schedule_time
    click_on "Create Scheduling"

    assert_text "Scheduling was successfully created"
    click_on "Back"
  end

  test "should update Scheduling" do
    visit scheduling_url(@scheduling)
    click_on "Edit this scheduling", match: :first

    fill_in "Account", with: @scheduling.account_id
    fill_in "Device", with: @scheduling.device_id
    fill_in "Group", with: @scheduling.group_id
    fill_in "Schedule time", with: @scheduling.schedule_time
    click_on "Update Scheduling"

    assert_text "Scheduling was successfully updated"
    click_on "Back"
  end

  test "should destroy Scheduling" do
    visit scheduling_url(@scheduling)
    click_on "Destroy this scheduling", match: :first

    assert_text "Scheduling was successfully destroyed"
  end
end
