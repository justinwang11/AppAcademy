class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
      t.boolean :privacy, null: false
      t.boolean :completion, null: false, default: false

      t.timestamps null: false
    end
  end
end
