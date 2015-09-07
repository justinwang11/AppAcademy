class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :title, null: false
      t.integer :card_id, null: false
      t.boolean :done?
      t.timestamps null: false
    end
  end
end
