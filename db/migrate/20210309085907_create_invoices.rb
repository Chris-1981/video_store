class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :totalPrice
      t.integer :totalPoints

      t.timestamps
    end
  end
end
