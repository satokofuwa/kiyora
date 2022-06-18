FactoryBot.define do
  factory :user, class: User do
    id { 1 }
    name { 'admin' }
    email { 'admin@test.com' }
    password { '1234567+A' }
    password_confirmation { '1234567+A' }
    admin { 'true' }
  end
  factory :second_user, class: User do
    id { 2 }
    name { 'general' }
    email { 'general@test.com' }
    password { '1234567+A' }
    password_confirmation { '1234567+A' }
    admin { 'false' }
  end
end
