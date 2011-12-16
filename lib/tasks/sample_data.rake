require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate =>:environment do
    Rake::Task['db:reset'].invoke
    PublicUser.create!(:name=> "Example User",
                       :email=>"example@railstutorial.com",
                       :password=>"gideon",
                       :password_confirmation=>"gideon")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.com"
      password = "password"
      PublicUser.create!(:name=>name,
                         :email=>email,
                         :password=> password,
                         :password_confirmation=>password)

    end
  end
end