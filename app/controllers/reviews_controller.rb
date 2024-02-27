class ReviewsController < ApplicationController
    before_action :set_review

    def index
        reviews = Review.all
        render json: ReviewBlueprint.render(reviews, view: :normal), status: :ok
    end

    def show
        render json: ReviewBlueprint.render(review, view: :normal), status: :ok
    end

    def create
        review = Review.new(review_params)

        if review.save
            render json: ReviewBlueprint.render(review, view: :normal), status: :created
        else
            render json: review.errors, status: :unprocessable_entity
        end
    end

    def update
    
        if review.update(review_params)
            render json: ReviewBlueprint.render(review, view: :normal), status: :ok
        else
            render json: review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if review.destroy
            render json: nil, status: :ok
        else
            render json: review.errors, status: :unprocessable_entity
        end
    end

    private

    def set_review
        review = Review.find(params[:id])
    end
    def review_params
        params.permit(:rating, :comment, :user_id, :item_id)
    end
end
