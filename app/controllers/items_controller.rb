class ItemsController < ApplicationController
    before_action :set_item

    def index
        items = Item.all
        render json: ItemBlueprint.render(items, view: :normal), status: :ok
    end

    def show
        item = Item.find(params[:id])
        render json: ItemBlueprint.render(@item, view: :normal), status: :ok
    end

    def create
        item = Item.new(item.params)

        if item.save
            render json: ItemBlueprint.render(item, view: :normal), status: :created 
        else
            render json: item.errors, status: :unprocessable_entity
        end
    end

    def update
        item = Item.find(params[:id])
        item.update(item_params)

        if @item.update(item_params)
            render json: ItemBlueprint.render(@item, view: :normal), status: :ok
        else
            render json: @item.errors, status: :unprocessable_entity
        end
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy

        if @item.destroy
            render json: nil, status: :ok
        else
            render json: @item.errors, status: :unprocessable_entity    
        end
    end

    private

    def set_item
        @item = Item.find(params[:id])
    end
    def item_params
        params.permit(:name, :category, :price, :description, :image_url)
    end
end
