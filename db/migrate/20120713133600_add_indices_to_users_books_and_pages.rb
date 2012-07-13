class AddIndicesToUsersBooksAndPages < ActiveRecord::Migration
  def change
    add_index :users, [:provider, :uid], unique: true
    add_index :books, [:author_id, :title], unique: true
    add_index :pages, [:book_id, :transacted_at]
  end
end
