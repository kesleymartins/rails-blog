FactoryBot.define do
    factory :post do
        title { Faker::Book.title }
        body { Faker::Books::Lovecraft.sentence(word_count: 22) }
        user { FactoryBot.create(:user) }
    end
end