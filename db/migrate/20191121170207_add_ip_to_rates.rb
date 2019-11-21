class AddIpToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :ip, :string
  end
end
