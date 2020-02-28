class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.integer :company_id
      t.string :date
      t.decimal :open_price
      t.decimal :high_price
      t.decimal :low_price
      t.decimal :close_price
      t.decimal :volume 
      t.timestamps
    end
  end
end
