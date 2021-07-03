class OrderShippment

  include ActiveModel::Model
  
  
  attr_accessor :postal_code, :ship_where_from_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id




  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :ship_where_from_id
    validates :city
    validates :house_number
    validates :phone_number,format: {with: /\A\d{10,11}\z/}
  end
 
  with_options numericality: { other_than: 1 } do
    validates :ship_where_from_id
  end
 


def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Shippment.create(postal_code: postal_code, ship_where_from_id: ship_where_from_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)


end


end
