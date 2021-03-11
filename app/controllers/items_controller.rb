class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
    def index
    end

    def new
      @item = Item.new
    end

    def create
      @item =  Item.new(item_params)
    end

    private
    def item_params
      params.require(:item).permit(:name, :info, :concept, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :schedule_delivery_id, :price, :image).merge(user_id: current_user.id)
    end
end
