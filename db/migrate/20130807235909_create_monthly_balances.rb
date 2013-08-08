class CreateMonthlyBalances < ActiveRecord::Migration
  def change
    create_table :monthly_balances do |t|
      t.integer :account_id
      t.integer :month
      t.date :date
      t.integer :balance

      t.timestamps
    end
  end
end
