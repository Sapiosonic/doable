json.extract! todo, :id, :name, :string, :description, :text, :created_at, :updated_at
json.url todo_url(todo, format: :json)
