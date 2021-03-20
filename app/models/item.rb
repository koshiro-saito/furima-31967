class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :time_to_ship

  with_options presence: true do

    validates :item_name
    validates :price
    validates :description
    validates :image
    
    with_options  numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :time_to_ship_id
    end
    
  end

  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }

end