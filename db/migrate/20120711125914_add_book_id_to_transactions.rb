class AddBookIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :book_id, :integer
  end
end
