class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :category
      t.integer :points
      t.integer :price
      
      t.timestamps
    end
  end
end
