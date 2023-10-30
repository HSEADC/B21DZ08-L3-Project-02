require "test_helper"

class SwapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @swap = swaps(:one)
  end

  test "should get index" do
    get swaps_url
    assert_response :success
  end

  test "should get new" do
    get new_swap_url
    assert_response :success
  end

  test "should create swap" do
    assert_difference("Swap.count") do
      post swaps_url, params: { swap: { description: @swap.description, title: @swap.title, user_id: @swap.user_id } }
    end

    assert_redirected_to swap_url(Swap.last)
  end

  test "should show swap" do
    get swap_url(@swap)
    assert_response :success
  end

  test "should get edit" do
    get edit_swap_url(@swap)
    assert_response :success
  end

  test "should update swap" do
    patch swap_url(@swap), params: { swap: { description: @swap.description, title: @swap.title, user_id: @swap.user_id } }
    assert_redirected_to swap_url(@swap)
  end

  test "should destroy swap" do
    assert_difference("Swap.count", -1) do
      delete swap_url(@swap)
    end

    assert_redirected_to swaps_url
  end
end
