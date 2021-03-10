class AddIdsToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :customer_id, :int
    add_column :invoices, :purchase_id, :int
    add_column :invoices, :movie_id, :int
  end
end
