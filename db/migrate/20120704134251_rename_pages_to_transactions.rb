class RenamePagesToTransactions < ActiveRecord::Migration
  def change
    rename_table :pages, :transactions
  end
end
