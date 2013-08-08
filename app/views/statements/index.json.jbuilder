json.array!(@statements) do |statement|
  json.extract! statement, :account_id, :month, :date, :type, :amount
  json.url statement_url(statement, format: :json)
end
