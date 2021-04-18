class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.references :purchase_history,  null: false, foreign_key: true
      t.string     :postal_code,       null: false, default: ""
      t.integer    :prefecture_id,     null: false
      t.string     :municipality,      null: false, default: ""
      t.string     :address,           null: false, default: ""
      t.string     :building_name,                  default: ""
      t.string     :phone_number,      null: false, default: ""

      t.timestamps
    end
  end
end