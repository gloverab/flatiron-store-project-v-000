class AddStatusToCart < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string, :default => "Not Submitted"
  end
end
