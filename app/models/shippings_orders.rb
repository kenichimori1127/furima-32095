class ShippingsOrders
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :postcode#, numericality: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id#, numericality: { other_than: 1, message: 'select' }
    validates :city#, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :block
    validates :phone_number#, numericality: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :user
    validates :item
  end
    validate :building

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)


  end
end
