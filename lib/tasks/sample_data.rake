namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Test.create!(started: true)
  end
end