class RenameTransactionsToPages < ActiveRecord::Migration
  def change
    rename_table :transactions, :pages
  end
end
