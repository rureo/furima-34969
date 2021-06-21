FactoryBot.define do
  factory :item do
  name        {"田中健介"}
 description         {"商品"}
 category_id    {2}
 status_id    {3}
 who_pay_shipping_charge_id     {2}
 ship_where_from_id   {4}
 delivery_day_id    {4}
 price   {2367}
association :user

after(:build) do |item|
  item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
end
  end
end
