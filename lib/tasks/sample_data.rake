require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate =>:environment do
    Rake::Task['db:reset'].invoke
    admin = PublicUser.create!(:name=> "Example User",
                               :email=>"example@railstutorial.com",
                               :password=>"gideon",
                               :password_confirmation=>"gideon")
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.com"
      password = "password"
      PublicUser.create!(:name=>name,
                         :email=>email,
                         :password=> password,
                         :password_confirmation=>password)

    end
    PublicUser.all(:limit => 6).each do |public_user|
      50.times do
        public_user.microposts.create!(:content=> Faker::Lorem.sentence(5))

      end
    end
  end
end

#rake db:populate