require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Code", with: @item.code
    fill_in "Created On", with: @item.created_on
    fill_in "Data", with: @item.data
    fill_in "Id", with: @item.id
    fill_in "Name", with: @item.name
    fill_in "Parent", with: @item.parent_id
    fill_in "Updated On", with: @item.updated_on
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Code", with: @item.code
    fill_in "Created On", with: @item.created_on
    fill_in "Data", with: @item.data
    fill_in "Id", with: @item.id
    fill_in "Name", with: @item.name
    fill_in "Parent", with: @item.parent_id
    fill_in "Updated On", with: @item.updated_on
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
