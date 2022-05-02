require "application_system_test_case"

class TriggersTest < ApplicationSystemTestCase
  setup do
    @trigger = triggers(:one)
  end

  test "visiting the index" do
    visit triggers_url
    assert_selector "h1", text: "Triggers"
  end

  test "should create trigger" do
    visit triggers_url
    click_on "New trigger"

    fill_in "Name", with: @trigger.name
    fill_in "Type", with: @trigger.type_id
    click_on "Create Trigger"

    assert_text "Trigger was successfully created"
    click_on "Back"
  end

  test "should update Trigger" do
    visit trigger_url(@trigger)
    click_on "Edit this trigger", match: :first

    fill_in "Name", with: @trigger.name
    fill_in "Type", with: @trigger.type_id
    click_on "Update Trigger"

    assert_text "Trigger was successfully updated"
    click_on "Back"
  end

  test "should destroy Trigger" do
    visit trigger_url(@trigger)
    click_on "Destroy this trigger", match: :first

    assert_text "Trigger was successfully destroyed"
  end
end
