json.array!(@boards) do |board|
  json.partial!("board", :board => board, :lists => @lists, :cards => @cards, :todo_items => @todo_items)
end
