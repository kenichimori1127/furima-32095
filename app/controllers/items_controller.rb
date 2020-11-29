class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create]
  before_action :set_item, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order("created_at DESC")
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
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
      if @item.user_id == current_user.id #(出品者であれば削除できる)
      redirect_to root_path #(トップページへ遷移させる)
      end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :explanation, :price, :category_id, :status_id, :burden_id, :area_id, :guideline_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

end
