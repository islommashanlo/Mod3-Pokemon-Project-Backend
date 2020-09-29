class ItemsController < ApplicationController
    before_action :find_item, only: [:new, :save, :create, :show, :update, :edit]

    def index
        items = Item.all
        render json: items
    end

    def create
        if Item.all.include?(@item)
            new_amount = @item.amount + 1
            @item.update(amount: new_amount)
            new_item = @item
        else
            api_id = api_call("item/#{item_params[:api_id].downcase}")["name"]
            name = api_call("item/#{api_id}")["names"][7]["name"]
            effect = api_call("item/#{api_id}")["effect_entries"][0]["short_effect"]
            img = api_call("item/#{api_id}")["sprites"]["default"]

            new_item = Item.create(name: name, effect: effect, img_url: img, user_id: item_params[:user_id], api_id: api_id)
        end
        render json: new_item
    end

    def update
        @item.update(item_params)
        render json: @item
    end

    private

    def find_item 
        @item = Item.find_by(name: item_params[:name], user_id: item_params[:user_id])
    end

    def item_params
        params.require(:item).permit(:name, :effect, :img_url, :user_id, :api_id)
    end
end
