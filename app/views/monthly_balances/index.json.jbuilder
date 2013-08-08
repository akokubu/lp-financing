json.array!(@monthly_balances) do |monthly_balance|
  json.extract! monthly_balance, :account_id, :month, :date, :balance
  json.url monthly_balance_url(monthly_balance, format: :json)
end
