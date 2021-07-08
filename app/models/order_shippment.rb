class OrderShippment

  include ActiveModel::Model
  
  
  attr_accessor :postal_code, :ship_where_from_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token




  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :ship_where_from_id,numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number,format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
  end
 
 



def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Shippment.create(postal_code: postal_code, ship_where_from_id: ship_where_from_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)


end


end

