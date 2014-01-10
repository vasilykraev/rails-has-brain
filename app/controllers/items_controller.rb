class ItemsController < ApplicationController

  def index
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br>")
  end

  # /items/1 GET
  def show
  end

  # /items/new GET
  def new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    item_params = params.require(:item).permit(:name, :description, :weight, :price, :real)
    @item = Item.create(item_params)
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end

  # /items/1 PUT + workaround POST
  def update
  end

  # /items/1 DELETE + workaround POST
  def destroy
  end

end
  