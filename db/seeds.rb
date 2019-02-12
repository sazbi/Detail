4.times do |store|
  Store.create(name: "Store number #{store}")
end
puts "4 Stores made"

9.times do |kia|
  User.create(username: "kia#{kia}", email: "kia#{kia}@test.com", first_name: 'Kia', last_name: "Test #{kia}", password: "asdfasdf", password_confirmation: "asdfasdf", store_ids: [1], dms_id: "100#{kia}")
end

9.times do |mz|
  User.create(username: "mz#{mz}", email: "mz#{mz}@test.com", first_name: 'Mz', last_name: "Test #{mz}", password: "asdfasdf", password_confirmation: "asdfasdf", store_ids: [2], dms_id: "200#{mz}")
end

9.times do |dg|
  User.create(username: "dodge#{dg}", email: "dodge#{dg}@test.com", first_name: 'Dodge', last_name: "Test #{dg}", password: "asdfasdf", password_confirmation: "asdfasdf", store_ids: [3], dms_id: "300#{dg}")
end

9.times do |inf|
  User.create(username: "inf#{inf}", email: "inf#{inf}@test.com", first_name: 'Inf', last_name: "Test #{inf}", password: "asdfasdf", password_confirmation: "asdfasdf", store_ids: [4], dms_id: "400#{inf}")
end

@manager1 = ManagerUser.create(username: "testmanager1", email: "manager1@test.com", first_name: 'Test', last_name: 'Manager1', password: "asdfasdf", dms_id: "1010", password_confirmation: "asdfasdf", store_ids: [1])
@manager2 = ManagerUser.create(username: "testmanager2", email: "manager2@test.com", first_name: 'Test', last_name: 'Manager2', password: "asdfasdf", dms_id: "2010", password_confirmation: "asdfasdf", store_ids: [2])
@manager3 = ManagerUser.create(username: "testmanager3", email: "manager3@test.com", first_name: 'Test', last_name: 'Manager3', password: "asdfasdf", dms_id: "3010", password_confirmation: "asdfasdf", store_ids: [3])
@manager4 = ManagerUser.create(username: "testmanager4", email: "manager4@test.com", first_name: 'Test', last_name: 'Manager4', password: "asdfasdf", dms_id: "4010", password_confirmation: "asdfasdf", store_ids: [4])
puts "4 Managers made"

@admin = AdminUser.create(username: "testadmin", email: "apierson@bonifacehiers.com", first_name: 'Test', last_name: 'Admin', password: "asdfasdf", password_confirmation: "asdfasdf", store_ids: [1,2,3,4])
puts "Admin Created"

10.times do |service|
  Service.create(service_name: "Service #{service}", pay_time: 1.0, store_id: 1)
end

10.times do |service|
  Service.create(service_name: "Service #{service}", pay_time: 1.0, store_id: 2)
end

10.times do |service|
  Service.create(service_name: "Service #{service}", pay_time: 1.0, store_id: 3)
end

10.times do |service|
  Service.create(service_name: "Service #{service}", pay_time: 1.0, store_id: 4)
end

puts "10 Services Made"

30.times do |post|
  Post.create(stk_num: "K30#{post}", user_id: rand(1..9), service_ids: [rand(1..4), rand(5..7), rand(8..10)], store_id: 1, status: rand(0..3), date: Date.today)
end

30.times do |post|
  Post.create(stk_num: "K30#{post}", user_id: rand(1..9), service_ids: [rand(1..4), rand(5..7), rand(8..10)], store_id: 1, status: rand(0..3), date: (Date.today - 7))
end

30.times do |post|
  Post.create(stk_num: "M30#{post}", user_id: rand(10..18), service_ids: [rand(11..4), rand(15..17), rand(18..20)], store_id: 2, status: rand(0..3), date: Date.today)
end

30.times do |post|
  Post.create(stk_num: "M30#{post}", user_id: rand(10..18), service_ids: [rand(11..14), rand(15..17), rand(18..20)], store_id: 2, status: rand(0..3), date: (Date.today - 7))
end

30.times do |post|
  Post.create(stk_num: "D30#{post}", user_id: rand(19..27), service_ids: [rand(21..24), rand(25..27), rand(28..30)], store_id: 3, status: rand(0..3), date: Date.today)
end

30.times do |post|
  Post.create(stk_num: "D30#{post}", user_id: rand(19..27), service_ids: [rand(21..24), rand(25..27), rand(28..30)], store_id: 3, status: rand(0..3), date: (Date.today - 7))
end

30.times do |post|
  Post.create(stk_num: "I30#{post}", user_id: rand(28..36), service_ids: [rand(31..34), rand(35..37), rand(38..40)], store_id: 4, status: rand(0..3), date: Date.today)
end

30.times do |post|
  Post.create(stk_num: "I30#{post}", user_id: rand(28..36), service_ids: [rand(31..34), rand(35..37), rand(38..40)], store_id: 4, status: rand(0..3), date: (Date.today - 7))
end

puts "240 Posts made"

