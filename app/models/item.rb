class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :sales_status
    belongs_to :shipping_fee_status
    belongs_to :prefecture
    belongs_to :schedule_delivery
    belongs_to :user
    has_one_attached :image

    with_options presence: true do
      validates :name
      validates :info
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :schedule_delivery_id
      validates :price
      validates :image
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_status_id
      validates :prefecture
      validates :schedule_delivery
    end

end
