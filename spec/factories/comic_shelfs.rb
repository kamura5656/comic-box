FactoryBot.define do
  factory :ComicShelf do
    title               { Faker::Verb.base }
    author              { Faker::Name.name }
    volume              { Faker::Number.within(range: 1..100) }
    status_id           { Faker::Number.within(range: 2..6) }
  end
end
