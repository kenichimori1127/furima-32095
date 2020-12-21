class ShippingsOrders
  include ActiveModel::Model
  attr_accessor :postcode, :area_id, :city, :block, :building, :phone_number, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "はハイフンも入力してください", allow_blank: true }
    validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角文字で入力してください", allow_blank: true }
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/  , message: "は11桁以内で入力してください", allow_blank: true }
    validates :user_id
    validates :item_id
  end
    validate :building

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)


  end
end
