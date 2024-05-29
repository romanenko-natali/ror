require "application_system_test_case"

class TaskItemsTest < ApplicationSystemTestCase
  setup do
    @task_item = task_items(:one)
  end

  test "visiting the index" do
    visit task_items_url
    assert_selector "h1", text: "Task items"
  end

  test "should create task item" do
    visit task_items_url
    click_on "New task item"

    fill_in "Body", with: @task_item.body
    check "Published" if @task_item.published
    fill_in "Title", with: @task_item.title
    click_on "Create Task item"

    assert_text "Task item was successfully created"
    click_on "Back"
  end

  test "should update Task item" do
    visit task_item_url(@task_item)
    click_on "Edit this task item", match: :first

    fill_in "Body", with: @task_item.body
    check "Published" if @task_item.published
    fill_in "Title", with: @task_item.title
    click_on "Update Task item"

    assert_text "Task item was successfully updated"
    click_on "Back"
  end

  test "should destroy Task item" do
    visit task_item_url(@task_item)
    click_on "Destroy this task item", match: :first

    assert_text "Task item was successfully destroyed"
  end
end
