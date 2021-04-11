FactoryBot.define do
  factory :box do
    comment             { }
    comic_id            { 1 }
    association :user
  end
end
