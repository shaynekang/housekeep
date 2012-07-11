class CreateBooks < ActiveRecord::Migration
  def change
  	create_table :books do |t|
  		t.references :user
  		t.string :title
  		t.timestamps
  	end
  end
end
