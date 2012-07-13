class RenameFromUserIdToAuthorIdOfBooks < ActiveRecord::Migration
  def change
    rename_column :books, :user_id, :author_id
  end
end
