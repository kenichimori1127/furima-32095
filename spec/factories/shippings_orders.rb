FactoryBot.define do
  factory :shippings_orders do
    token        {"tokentest"}
    postcode     { "123-5678" }
    area_id      { 2 }
    city         { "世田谷区" }
    block        { 11 }
    building     { "ヒルズ" }
    phone_number { '09012345678' }
    user_id      { 2 }
    item_id      { 2 }
  end
end
