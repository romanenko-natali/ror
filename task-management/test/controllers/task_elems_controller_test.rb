require "test_helper"

class TaskElemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_elem = task_elems(:one)
  end

  test "should get index" do
    get task_elems_url
    assert_response :success
  end

  test "should get new" do
    get new_task_elem_url
    assert_response :success
  end

  test "should create task_elem" do
    assert_difference("TaskElem.count") do
      post task_elems_url, params: { task_elem: { description: @task_elem.description, project_id: @task_elem.project_id, published: @task_elem.published, title: @task_elem.title } }
    end

    assert_redirected_to task_elem_url(TaskElem.last)
  end

  test "should show task_elem" do
    get task_elem_url(@task_elem)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_elem_url(@task_elem)
    assert_response :success
  end

  test "should update task_elem" do
    patch task_elem_url(@task_elem), params: { task_elem: { description: @task_elem.description, project_id: @task_elem.project_id, published: @task_elem.published, title: @task_elem.title } }
    assert_redirected_to task_elem_url(@task_elem)
  end

  test "should destroy task_elem" do
    assert_difference("TaskElem.count", -1) do
      delete task_elem_url(@task_elem)
    end

    assert_redirected_to task_elems_url
  end
end
