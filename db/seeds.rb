10.times do |n|
  name  = Gimei.kanji
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji
  start_time = Faker::Time.forward(days: 23, period: :morning)
  end_time = Faker::Time.forward(days: 23, period: :evening)
  dispatch = Faker::Commerce.price(range: 0..10.0, as_string: true)
  Task.create!(
    id: "#{1000+n}",
    name: '定期建築設備点検',
    dispatch: 1,
    content: '3年に1回',
    support_at: '2022/5/16',
    start_time: start_time,
    end_time: end_time,
    category: rand(0..12),
    step: rand(0..7),
    sales_check: rand(0..1),
    admin_check: rand(0..1),
    vehicle: "#{n+1}"'号車',
    sales: '19800',
    confirmation: rand(0..1),
    user_id: "#{n+1}",
    created_at:  '2022-01-01 00:00:00',
    updated_at:  '2022-01-01 00:00:00'
  )
end

10.times do |n|
  name  = Faker::Company.name
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji 
  manager_name  = Gimei.kanji  
  Agent.create!(
    task_id:     "#{1000+n}",
    name:        name,
    zip:         1111111,
    prefecture:  prefecture,
    city:        city,
    address:     address,
    tel:         tel,
    manager_name:manager_name,
    created_at:  '2022-01-01 00:00:00',
    updated_at:  '2022-01-01 00:00:00'
  )
end
10.times do |n|
  name  = Gimei.kanji
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji   
  FrontManager.create!(
    task_id:      "#{1000+n}",
    manager:         rand(1..2), 
    tel:          tel,
    support_at:   '月、火',
    office_hours: '9:00-16:00',
    content:      '連絡をとること',
    created_at:   '2022-01-01 00:00:00',
    updated_at:   '2022-01-01 00:00:00',
  )
end
10.times do |n|
  name  = Gimei.kanji
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji   
  Invoice.create!(
    task_id:      "#{1000+n}",
    invoice_no:   "#{n + 1000}",
    issued_on:    '2022/5/31',
    support_at:   '2022/5/20',
    tax_included: 14800,
    bank:         "菱形銀行",
    content:      "ご用命くださりありがとうございました。" ,
    created_at:   '2022-01-01 00:00:00',
    updated_at:   '2022-01-01 00:00:00',
  )
end
10.times do |n|
  name  = Gimei.kanji
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji   
  Customer.create!(
    task_id:     "#{1000+n}",
    name:        name,
    prefecture:  prefecture,
    zip:         1111111,
    address:     address,
    tel:         tel,
    room_number: '201', 
    created_at:  '2022-01-01 00:00:00',
    updated_at:  '2022-01-01 00:00:00'
  )
end
5.times do |n| #管理者作成
  name  = Gimei.kanji
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji   
  User.create!(
    task_id:                "#{1000+n}",
    name:                   name,
    created_at:             '2022-01-01 00:00:00',
    updated_at:             '2022-01-01 00:00:00',
    email:                  email,
    password:               '000000',
    admin:                  true,
    reset_password_token:   "#{000000+n}",
    reset_password_sent_at: "#{000000+n}",
    remember_created_at:    '2022/01/01' 
  )
end

10.times do |n|
  name  = Gimei.kanji
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji   
  Claim.create!(
    task_id:         "#{1000+n}",
    troubled_at:     '2022/01/01',
    category:        1,
    content:         '下階への漏水被害',
    support_content: '一時対応を行う',
    created_at:      '2022-01-01 00:00:00',
    updated_at:      '2022-01-01 00:00:00',
  )
end
10.times do |n|
  name  = Faker::Company.name
  email = Faker::Internet.email
  tel = Faker::Number.number(digits: 11)
  password = '000000'
  prefecture = Gimei.prefecture.kanji 
  city= Gimei.city.kanji 
  address= Gimei.town.kanji   
  Property.create!(
    task_id:     "#{1000+n}",
    name:       name,
    zip:        1111111,
    prefecture: prefecture,
    city:       city,
    address:    address,
    tel:        tel,
    created_at: '2022-01-01 00:00:00',
    updated_at: '2022-01-01 00:00:00'
  )
end
10.times do |n|
  name  = Faker::Company.name
  worker  = Gimei.kanji
  tel = Faker::Number.number(digits: 11)
  Partner.create!(
    name:       name,
    sales:        rand(0..30000),
    worker: worker,
    contact:       tel,
    created_at: '2022-01-01 00:00:00',
    updated_at: '2022-01-01 00:00:00'
  )
  end
  10.times do |n|
    TaskPartner.create!(
      task_id:  "#{1000+n}",
      partner_id: rand(1..10),
      created_at: '2022-01-01 00:00:00',
    )
  end
  5.times do |n| #管理者作成
    name  = Gimei.kanji
    email = Faker::Internet.email
    tel = Faker::Number.number(digits: 11)
    password = '000000'
    prefecture = Gimei.prefecture.kanji 
    city= Gimei.city.kanji 
    address= Gimei.town.kanji   
    User.create!(
      task_id:                "#{1004+n}",
      name:                   name,
      created_at:             '2022-01-01 00:00:00',
      updated_at:             '2022-01-01 00:00:00',
      email:                  email,
      password:               '000000',
      admin:                  false,
      remember_created_at:    '2022/01/01' 
    )
  end
  require "csv"
  CSV.foreach('db/ブック-2.csv') do |row|
    Prefecture.create(id: row[0], area: row[1], kanji: row[2], romaji: row[3])
  end