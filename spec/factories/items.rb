FactoryBot.define do
  factory :item do
    product_name {Faker::Name.initials(number: 5)}
    explanation  { "aaa"}
    price        { "300" }
    category_id  { "2" }
    status_id    { "2" }
    burden_id    { "2" }
    area_id      { "2" }
    guideline_id { "2" }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
