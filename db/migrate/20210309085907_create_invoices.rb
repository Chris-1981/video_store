class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :totalPrice
      t.integer :totalPoints
      t.integer :customer_id
      t.integer :order_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
