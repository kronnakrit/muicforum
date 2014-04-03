namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Sun K",
                 email: "sun@gmail.com",
                 password: "123123",
                 password_confirmation: "123123",
                 admin: true)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
  	end

  	Board.create!(title: "General", subtitle: "Talk today, talk to us!")
  	Board.create!(title: "BBA", subtitle: "IB, Finance, Marketing, IS, BE")
  	Board.create!(title: "Science", subtitle: "FS, Biology, Chemistry, Physics, AM, EN, CS")
  	Board.create!(title: "FAA", subtitle: "EM, FP, TP, CDP")
  	Board.create!(title: "Social Science", subtitle: "Internation Studies, Modern World History, Southeast Asian Studies")
  	Board.create!(title: "Computer Engineering", subtitle: "About computer hardware and computer programming.")

      users = User.all(limit: 6)
	50.times do
	  	title = Faker::Lorem.sentence(1)
	  	content = Faker::Lorem.sentence(5)
	  	users.each { |user| user.topics.create!(subtitle: content, board_id: 1, title: title) }
    end
  end

end