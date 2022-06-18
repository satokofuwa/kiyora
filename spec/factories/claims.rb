FactoryBot.define do
  factory :claim do
    id {1}
    task_id {1}
    troubled_at {'2022-01-01 00:00:00'}
    category{'要対応'}
    content {'クレームあり'}
    support_content{'前回の続きの作業を行う'}
    created_at {'2022-01-01 00:00:00'}
    updated_at{'2022-01-01 00:00:00'}
  end
end
