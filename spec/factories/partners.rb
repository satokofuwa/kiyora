FactoryBot.define do
  factory :partner do
      id     {1}
      name       {'株式会社建設'}
      sales      {19800}
      worker     {'山田たろう'}
      contact    {'info@contact.com'}
      created_at {'2022-01-01 00:00:00'}
      updated_at {'2022-01-01 00:00:00'}
  end
end
