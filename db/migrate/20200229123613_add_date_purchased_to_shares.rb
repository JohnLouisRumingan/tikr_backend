class AddDatePurchasedToShares < ActiveRecord::Migration[6.0]
  def change
    add_column :shares, :purchase_date, :string
  end
end
