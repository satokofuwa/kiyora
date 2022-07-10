require "csv"
CSV.foreach('db/伝票情報.csv') do |row|
  Task.create(id: row[0], name: row[1], dispatch: row[2], content: row[3], support_at: row[4],
    start_time: row[5], end_time: row[6], category: row[7], step: row[8], sales_check: row[9],
    admin_check: row[10], vehicle: row[11], sales: row[12], confirmation: row[13], user_id: row[14],
    created_at:row[15], updated_at:row[16]
  )
end
CSV.foreach('db/ブック-2.csv') do |row|
  Prefecture.create(id: row[0], area: row[1], kanji: row[2], romaji: row[3])
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
18.times do |n|
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
    zip:         1160002,
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
    remember_created_at:    '2022/01/01',
    uid: n,
    provider: n,
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
<<<<<<< HEAD
<<<<<<< HEAD

=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  
  5.times do |n| #管理者作成
=======
=======
=======
>>>>>>> 541afd4 (uid, provider 設定の為ゲストログインできない機能実装)

=======
>>>>>>> f5604c1 (uid provider設定によるゲストログインができない件を修正)
>>>>>>> de3efff (uid provider設定によるゲストログインができない件を修正)
>>>>>>> eb18b28 (uid provider設定によるゲストログインができない件を修正)
  5.times do |n| #ユーザー作成
<<<<<<< HEAD

=======
<<<<<<< HEAD
>>>>>>> f5604c1 (uid provider設定によるゲストログインができない件を修正)
=======
=======
  
  5.times do |n| #管理者作成
>>>>>>> 83cfb1f (uid, provider 設定の為ゲストログインできない機能実装)
>>>>>>> 541afd4 (uid, provider 設定の為ゲストログインできない機能実装)
>>>>>>> 801ba37 (uid, provider 設定の為ゲストログインできない機能実装)
=======


  5.times do |n| #ユーザー作成
>>>>>>> 0d064c5 (syuusei)
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
      remember_created_at:    '2022/01/01',
      uid: n+5,
      provider: n+5
    )
  end