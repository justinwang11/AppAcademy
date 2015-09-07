class RemoveStatusDefault < ActiveRecord::Migration
  def change
    remove_column :cat_rental_requests, :status
    add_column :cat_rental_requests, :status, :string
  end
end
