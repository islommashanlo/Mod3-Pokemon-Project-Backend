class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.find_or_create_by(name: user_params[:name].downcase)
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :current_hp, :max_hp)
    end

end
