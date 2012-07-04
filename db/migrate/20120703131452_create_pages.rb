class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.decimal :amount, default: 0.0
      t.text :note
      t.timestamps
    end
  end
end
