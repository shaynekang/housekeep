class AddTransactedAtToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :transacted_at, :datetime
  end
end
