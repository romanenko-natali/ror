require "application_system_test_case"

class TaskElemsTest < ApplicationSystemTestCase
  setup do
    @task_elem = task_elems(:one)
  end

  test "visiting the index" do
    visit task_elems_url
    assert_selector "h1", text: "Task elems"
  end

  test "should create task elem" do
    visit task_elems_url
    click_on "New task elem"

    fill_in "Description", with: @task_elem.description
    fill_in "Project", with: @task_elem.project_id
    check "Published" if @task_elem.published
    fill_in "Title", with: @task_elem.title
    click_on "Create Task elem"

    assert_text "Task elem was successfully created"
    click_on "Back"
  end

  test "should update Task elem" do
    visit task_elem_url(@task_elem)
    click_on "Edit this task elem", match: :first

    fill_in "Description", with: @task_elem.description
    fill_in "Project", with: @task_elem.project_id
    check "Published" if @task_elem.published
    fill_in "Title", with: @task_elem.title
    click_on "Update Task elem"

    assert_text "Task elem was successfully updated"
    click_on "Back"
  end

  test "should destroy Task elem" do
    visit task_elem_url(@task_elem)
    click_on "Destroy this task elem", match: :first

    assert_text "Task elem was successfully destroyed"
  end
end
