FactoryBot.define do
  factory :agent do
    task_id     {1}
    name       {'建築不動産'}
    zip        { 1111111 }
    prefecture  { '東京都' }
    city        { '世田谷区' }
    address     { '用賀' }
    tel         { '0120-777-777' }
    manager_name {'田中'}
    created_at  { '2022-01-01 00:00:00'}
    updated_at  { '2022-01-01 00:00:00'}
  end
end
