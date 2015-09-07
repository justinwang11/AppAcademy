class CreateComments < ActiveRecord::Migration
  def change
    drop_table :comments
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.timestamps null: false
    end
  end
end
