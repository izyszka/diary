class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :nick
      t.integer :post_id

      t.timestamps
    end
  end
end
