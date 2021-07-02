class OrderShippment

  include ActiveModel::Model
  
  
  attr_accessor :postal_code, :ship_where_from_id, :city, :house_number, :building_name, :phone_number, :user, :item




  with_options presence: true do
    validates :postal_code 
    validates :ship_where_from_id
    validates :city
    validates :house_number
    validates :phone_number
  end
 
  with_options numericality: { other_than: 1 } do
    validates :hip_where_from_id
  end
 


def save
  Order.create(user: user, item: item)
  Shippment.create(postal_code: postal_code, ship_where_from_id: ship_where_from_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order: order)


  


end


end