class AddMoviidToPurchases < ActiveRecord::Migration[6.1]
  def change
    add_column :purchases, :movie_id, :int
  end
end
