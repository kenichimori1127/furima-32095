class ShippingsOrders
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number, :order_id, :item_id, :user_id, :token


  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :area_id, numericality: { other_than: 1, message: 'select' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :block
    validates :phone_number, format: {with: /\A\d{11}\z/  , message: "is invalid."}
    validates :user_id
    validates :item_id
  end
    validate :building

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)


  end
end
