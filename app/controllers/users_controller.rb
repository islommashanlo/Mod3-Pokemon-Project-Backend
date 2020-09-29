class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]

    def index
        users = User.all
        render json: users
    end
    
    def show
        @user
        render json: @user
    end

    def create
        user = User.find_or_create_by(name: user_params[:name].downcase)
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :current_hp, :max_hp)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
