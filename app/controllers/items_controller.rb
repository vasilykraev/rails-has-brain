class ItemsController < ApplicationController

  def index
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br>")
  end

  def create
    @item = Item.create(name: params[:name], description: params[:name], weight: params[:weight], price: params[:price], real: params[:real])
    render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  end

end
  