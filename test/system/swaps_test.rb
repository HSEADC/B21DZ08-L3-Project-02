require "application_system_test_case"

class SwapsTest < ApplicationSystemTestCase
  setup do
    @swap = swaps(:one)
  end

  test "visiting the index" do
    visit swaps_url
    assert_selector "h1", text: "Swaps"
  end

  test "should create swap" do
    visit swaps_url
    click_on "New swap"

    fill_in "Description", with: @swap.description
    fill_in "Title", with: @swap.title
    fill_in "User", with: @swap.user_id
    click_on "Create Swap"

    assert_text "Swap was successfully created"
    click_on "Back"
  end

  test "should update Swap" do
    visit swap_url(@swap)
    click_on "Edit this swap", match: :first

    fill_in "Description", with: @swap.description
    fill_in "Title", with: @swap.title
    fill_in "User", with: @swap.user_id
    click_on "Update Swap"

    assert_text "Swap was successfully updated"
    click_on "Back"
  end

  test "should destroy Swap" do
    visit swap_url(@swap)
    click_on "Destroy this swap", match: :first

    assert_text "Swap was successfully destroyed"
  end
end
