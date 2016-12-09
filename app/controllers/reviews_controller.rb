class ReviewsController < ApplicationController
  before_action :find_collection, only: [:create]
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! # not needed as device controls this
  def index
    current_user.reviews
  end

  def show
  # will show in the collections page
  end

  def new
    # @review = Review.new
    # this should be on the collections 'show' controller
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.collection = @collection
    # raise
    # @review.save

    if @review.save
      flash[:notice] = 'your review has been published'
      redirect_to collections_path
    else
      flash[:notice] = 'review invalid'
      redirect_to collection_path(@collection)
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    #redirect_to collection_path(@review)
  end

  def destroy
    @review.destroy
    #redirect_to collection_path(@review)
  end

private
  def find_collection
    @collection = Collection.find(params[:collection_id])
    # ^ this becuase the routes are set to collections/collection_id/review
  end
  def find_review
    @review = Review.find(params[:id])
  end
  def review_params
    params.require(:review).permit(:phrase, :my_rating)
  end

end
