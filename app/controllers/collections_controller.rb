class CollectionsController < ApplicationController
    before_action :set_collection, only: [:show]
  def index
    @collections = current_user.collections
  end

  def show
    @review = Review.new
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @tag.user = current_user
    @collection.save
    redirect_to collections_path(@collection)
  end

  # def edit
  #   @collection = Collection.find(params[:id])
  # end

  # def update
  #   @collection = Collection.find(params[:id])
  #   @collection.update(collection_params)
  # #   redirect_to collections_path(@collection)
  # end

  # def destroy
  #   @collection = Collection.find(params[:id])
  #   @collection.destroy
  #   redirect_to collections_path
  # end

  private
  def set_collection
    @collection = Collection.find(params[:id])
  end
  def collection_params
    params.require(:collection).permit(:id, :user_id, :movie_id, :media)
  end
end
