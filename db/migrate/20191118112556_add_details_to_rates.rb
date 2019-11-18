class AddDetailsToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :movie_id, :integer
  end
end
