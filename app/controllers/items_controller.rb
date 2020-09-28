class ItemsController < ApplicationController
    before_action :find_item, only: [:new, :save, :create, :show, :update, :edit]

    def create
        if Item.all.include?(@item)
            new_amount = item_params[:amount] + 1
            @item.update(new_amount)
        else
            name = api_call("item/#{params[:id]}")["name"]
            effect = api_call("item/#{params[:id]}")["effect_entries"][0]["short_effect"]
            img = api_call("item/#{params[:id]}")["sprites"]["default"]

            new_item = Item.create(name: name, effect: effect, img_url: img, :amount: 1, user_id: item_params[:user_id])
        end
    end

    def update
        @item.update(item_params)
    end

    private

    def find_item 
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :effect, :img_url, :user_id)
    end
end
