class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :who_pay_shipping_charge
  belongs_to :ship_where_from
  belongs_to :delivery_day
  has_one_attached :image
  
with_options presence: true do
  validates :title
  validates :description
  validates :category
  validates :status
  validates :who_pay_shipping_charge
  validates :ship_where_from
  validates :delivery_day

  end

  with_options  numericality:{ other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :who_pay_shipping_charge_id
    validates :ship_where_from_id
    validates :delivery_day_id

  end




end
