class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title        , null: false
      t.text       :text         , null: false
      t.integer    :category_id     , null: false
      t.integer    :status_id     , null: false
      t.integer    :who_pay_shipping_charge_id     , null: false
      t.integer    :ship_where_from_id    , null: false
      t.integer    :delivery_day_id    , null: false

      t.timestamps
    end
  end
end
