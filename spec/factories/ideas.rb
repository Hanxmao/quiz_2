FactoryBot.define do
  RANDOM_100_CHARS = "hello world hello world hello world hello world hello world hello world hello world hello hello worl hello world hello world"
  factory :idea do
    sequence(:title) { |n| Faker::Job.title + " #{n}"}
    description { Faker::Job.field + "-#{RANDOM_100_CHARS}"}
    association :user, factory: :user
  end
end
