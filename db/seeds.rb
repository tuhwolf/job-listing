# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Hello World!'
puts '這個種子檔會自動建立一個admin帳號, 並且随机創建 20個jobs，15个隐藏的jobs'

create_account = User.create([email: 'admin@gmail.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts 'Admin account is created successfully!'

job_info = [
  'RoR developer wanted',
  'IOS developer wanted',
  'Android developer wanted',
  'Web developer wanted',
  'Copy writer wanted',
  'UI designer wanted',
  'Customer service manager wanted',
  'Product manager wanted',
  'Front-end engineer wanted',
  'Market analysis manager wanted',
  'php developer wanted',
  'python developer wanted',
  'JAVA developer wanted',
  'Data analysis manager wanted',
  'Facial designer wanted'
]
create_jobs = for i in 1..20 do
                Job.create!([title: job_info[rand(job_info.length)], description: "public job info", wage_upper_bound: rand(40..79) * 1000, wage_lower_bound: rand(20..39) * 1000, is_hidden: 'false'])
              end
for i in 1..10 do
  Job.create!([title: job_info[rand(job_info.length)], description: "hidden job info", wage_upper_bound: rand(40..79) * 1000, wage_lower_bound: rand(20..39) * 1000, is_hidden: 'true'])
end

puts '10 Hidden jobs created.'
