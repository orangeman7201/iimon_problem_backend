class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def item_params
      params.permit(:name, :price, :text)
    end
end
