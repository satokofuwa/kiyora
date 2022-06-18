FactoryBot.define do
  factory :invoice do
    task { user.task }
    id       { 1 }
    task_id      { 1 }
    invoice_no   { 10002 }
    issued_on    {'2022-01-01 00:00:00'}
    support_at   {'2022-01-01 00:00:00'}
    tax_included {'2022-01-01 00:00:00'}
    bank         {'菱丸銀行'}
    content      {'前回の請求'}
    created_at   {'2022-01-01 00:00:00'}
    updated_at   {'2022-01-01 00:00:00'}
  end
end
