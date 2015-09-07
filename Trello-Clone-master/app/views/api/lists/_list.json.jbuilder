json.(list, :id, :title, :board_id, :created_at, :updated_at)

json.cards cards do |card|
  json.partial!("api/cards/card", :card => card, :todo_items => todo_items)
end
