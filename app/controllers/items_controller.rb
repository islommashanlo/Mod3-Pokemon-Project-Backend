class ItemsController < ApplicationController
    before_action :find_item, only: [:new, :save, :create, :show, :update, :edit]

    def create
        if Item.all.include?(@item)
            new_amount = @item.amount + 1
            @item.update(amount: new_amount)
        else
            name = api_call("item/#{item_params[:name].downcase}")["name"]
            effect = api_call("item/#{name}")["effect_entries"][0]["short_effect"]
            img = api_call("item/#{name}")["sprites"]["default"]

            new_item = Item.create(name: name, effect: effect, img_url: img, user_id: item_params[:user_id])
        end
    end

    def update
        @item.update(item_params)
    end

    private

    def find_item 
        @item = Item.find_by(name: item_params[:name], user_id: item_params[:user_id])
    end

    def item_params
        params.require(:item).permit(:name, :effect, :img_url, :user_id)
    end
end
