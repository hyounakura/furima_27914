class ItemParchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.item_parchase.present?
    @address = ItemAddress.new
  end

  def create
    @address = ItemAddress.new(item_address_params)
    if @address.valid?
      pay_item
      @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def item_address_params
    params.require(:item_address).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
