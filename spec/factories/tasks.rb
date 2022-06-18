FactoryBot.define do 
  factory :task,class: Task do
    id { 1 }
    name {'定期建築設備点検'}
    dispatch { 1 }
    content {'3年に1回'}
    support_at {'2022/5/16'}
    start_time {'2022-01-01 00:00:00'}
    end_time {'2022-01-01 00:00:00'}
    category {1}
    step {2}
    sales_check {"確定"}
    admin_check {"未承認"}
    vehicle {5}
    sales {'19800'}
    confirmation {0}
    user_id {1}
    created_at  {'2022-01-01 00:00:00'}
    updated_at  {'2022-01-01 00:00:00'}
  end
  factory :second_task,class: Task do
    id { 2 }
    name {'定期建築設備点検'}
    dispatch { 1 }
    content {'3年に1回'}
    support_at {'2022/5/16'}
    start_time {'2022-01-01 00:00:00'}
    end_time {'2022-01-01 00:00:00'}
    category {1}
    step {2}
    sales_check {"確定"}
    admin_check {"未承認"}
    vehicle {5}
    sales {'19800'}
    confirmation {0}
    user_id {2}
    created_at  {'2022-01-01 00:00:00'}
    updated_at  {'2022-01-01 00:00:00'}
  end
end
