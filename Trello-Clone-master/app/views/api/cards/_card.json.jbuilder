json.(card, :id, :title, :list_id, :description)

json.todo_items todo_items do |todo_item|
  json.partial!("api/todo_items/todo_item", :todo_item => todo_item)
end
