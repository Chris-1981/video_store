class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.integer :customer_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
