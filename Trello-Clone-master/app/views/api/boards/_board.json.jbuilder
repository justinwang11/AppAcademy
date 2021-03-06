json.(board, :id, :title, :created_at, :updated_at)

lists ||= nil
unless lists.nil?
  json.lists lists do |list|
    json.partial!("api/lists/list", :list => list, :cards => cards, :todo_items => todo_items)
  end
end
