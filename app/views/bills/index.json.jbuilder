json.bills do
  json.array!(@bills) do |bill|
    json.id bill.id
    json.name bill.name
    json.value bill.value
    json.installments bill.installments if bill.installments
    json.perpetual bill.perpetual if bill.perpetual
    json.receipt_url bill.receipt&.url
  end
end
