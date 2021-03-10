class AddIdsToPurchase < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :customer_id, :int 
  end
end
