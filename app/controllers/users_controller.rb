class UsersController < ApplicationController
    before_action :set_user

    def index
        users = User.all
        render json: UserBlueprint.render(users, view: :normal), status: :ok
    end

    def show
        render json: UserBlueprint.render(@user, view: :normal), status: :ok
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: UserBlueprint.render(user, view: :normal), status: :created   
        else
            render json: user.errors, status: :unprocessable_entity    
        end
    end

    def update
        if @user.update(user_params)
            render json: UserBlueprint.render(@user, view: :normal), status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @user.destroy
            render json: nil, status: :ok
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.permit(:first_name, :last_name, :email, :username, :password)
    end
end
