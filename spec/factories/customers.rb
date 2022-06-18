FactoryBot.define do
  factory :customer,class: Customer do
    id { 1 }
    task_id {1}
    name {'山田太郎'}
    zip  {'2150000'}
    prefecture {'神奈川県'}
    address {'横浜市'}
    tel  {'070-000-0000'}
    room_number{'201'}
    created_at {'2022-01-01 00:00:00'}
    updated_at {'2022-01-01 00:00:00'}
  end
  factory :second_customer,class: Customer do
    id { 2 }
    task_id {2}
    name {'山田花子'}
    zip  {'2150000'}
    prefecture {'神奈川県'}
    address {'川崎市'}
    tel  {'070-000-0000'}
    room_number{'201'}
    created_at {'2022-01-01 00:00:00'}
    updated_at {'2022-01-01 00:00:00'}
  end
end
