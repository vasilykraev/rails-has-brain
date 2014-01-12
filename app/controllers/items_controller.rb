class ItemsController < ApplicationController

  def index
    @items = Item.all
    # render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br>")
  end

  # /items/1 GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: "404 Not found", status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    item_params = params.require(:item).permit(:name, :description, :weight, :price, :real)
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
    # render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end

  # /items/1 PUT + workaround POST
  def update
  end

  # /items/1 DELETE + workaround POST
  def destroy
  end

end
  