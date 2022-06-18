FactoryBot.define do
  factory :property do
    id       {1}
    task_id  {1}
    name     {'マンション'}
    zip      {'2000000'}
    prefecture {'神奈川県'}
    city {'川崎市'}
    address {'新川崎'}
    tel  {'0120-444-4444'}
    created_at  { '2022-01-01 00:00:00'}
    updated_at  { '2022-01-01 00:00:00'}
  end
end
