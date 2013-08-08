class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :account_id
      t.integer :month
      t.date :date
      t.string :type
      t.integer :amount

      t.timestamps
    end
  end
end
