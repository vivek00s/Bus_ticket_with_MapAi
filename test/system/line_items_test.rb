require "application_system_test_case"

class LineItemsTest < ApplicationSystemTestCase
  setup do
    @line_item = line_items(:one)
  end

  test "visiting the index" do
    visit line_items_url
    assert_selector "h1", text: "Line items"
  end

  test "should create line item" do
    visit line_items_url
    click_on "New line item"

    fill_in "Cart", with: @line_item.cart_id
    fill_in "Phone", with: @line_item.phone_id
    fill_in "Quantity", with: @line_item.quantity
    click_on "Create Line item"

    assert_text "Line item was successfully created"
    click_on "Back"
  end

  test "should update Line item" do
    visit line_item_url(@line_item)
    click_on "Edit this line item", match: :first

    fill_in "Cart", with: @line_item.cart_id
    fill_in "Phone", with: @line_item.phone_id
    fill_in "Quantity", with: @line_item.quantity
    click_on "Update Line item"

    assert_text "Line item was successfully updated"
    click_on "Back"
  end

  test "should destroy Line item" do
    visit line_item_url(@line_item)
    click_on "Destroy this line item", match: :first

    assert_text "Line item was successfully destroyed"
  end
end
