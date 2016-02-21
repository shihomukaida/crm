class AddPostToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :post, :string
  end
end
