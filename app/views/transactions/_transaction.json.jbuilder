json.extract! transaction, :id, :emitted_at, :value, :cpf, :card, :kind, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
