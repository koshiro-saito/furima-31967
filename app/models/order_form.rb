class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name,
                :phone_number, :token

  # buyerのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end
  # buyerのバリデーション

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    Buyer.create(purchase_history_id: purchase_history.id, postal_code: postal_code, prefecture_id: prefecture_id,
                  municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end
