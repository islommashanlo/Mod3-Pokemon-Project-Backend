class ItemsController < ApplicationController
    before_action :find_item, only: [:new, :save, :create, :show, :update, :edit, :destroy]

    def index
        items = Item.all
        render json: items
    end
    
    def show
        @item
        render json: @item
    end

    def destroy
        if @item.amount > 1
            item_amount = @item.amount
            item_amount -= 1
            @item.update(amount: item_amount)
            @item
        elsif @item.amount == 1
            @item.destroy
        else
            puts "Something went wrong"
        end
        render json: @item
    end
    def create
        if Item.all.any?{|e|e.api_id == item_params[:api_id] && e.user_id == item_params[:user_id]}
            item_amount = @item.amount
            item_amount += 1
            @item.update(amount: item_amount)
            new_item = @item
            new_item
        else
            api_id = api_call("item/#{item_params[:api_id].downcase}")["name"]
            name = api_call("item/#{api_id}")["names"][7]["name"]
            effect = api_call("item/#{api_id}")["effect_entries"][0]["short_effect"]
            img = api_call("item/#{api_id}")["sprites"]["default"]

            new_item = Item.create(name: name, effect: effect, img_url: img, user_id: item_params[:user_id], api_id: api_id)
            new_item
        end
        render json: new_item
    end

    def update
        @item.update(item_params)
        new_item = @item
        new_item
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
