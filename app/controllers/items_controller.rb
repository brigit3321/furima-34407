class ItemsController < ApplicationController
  before_action :set_item, only: [:update ,:edit, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new, :create, :show, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path(current_user.id)
    else
      render :edit
    end
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :concept, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :schedule_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if user_signed_in?
      if current_user.id != @item.user.id
        
    
        redirect_to action: :index
      end
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
