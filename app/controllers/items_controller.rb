class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
   else
      render 'edit'
   end
  end

  def destroy
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :show
    end
    @item.destroy
    redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
       redirect_to root_path
    else
       render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :value, :image, :category_id, :status_id, :delivery_fee_id, :shipping_area_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
