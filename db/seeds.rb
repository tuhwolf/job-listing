# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Hello World!'
puts '這個種子檔會自動建立一個帳號, 並且創建 20 個 jobs，每个job下建立10个resumes'

create_account = User.create([email: 'admin@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts 'Admin account created successfully!'

create_jobs = for i in 1..20 do
                Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个公开的工作", wage_upper_bound: rand(50..99) * 100, wage_lower_bound: rand(10..49) * 100, is_hidden: 'false'])
              end
for i in 1..10 do
  Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个隐藏的工作", wage_upper_bound: rand(50..99) * 100, wage_lower_bound: rand(10..49) * 100, is_hidden: 'true'])
end

puts '10 Hidden jobs created.'
