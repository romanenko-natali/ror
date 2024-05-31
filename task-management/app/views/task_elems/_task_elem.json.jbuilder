json.extract! task_elem, :id, :title, :description, :published, :project_id, :created_at, :updated_at
json.url task_elem_url(task_elem, format: :json)
