class WhoPayShippingCharge < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '着払い（購入者支払い）' },
    { id: 3, name: '送料込み（出品者支払い）' }

  ]

  include ActiveHash::Associations
  has_many :items
end
