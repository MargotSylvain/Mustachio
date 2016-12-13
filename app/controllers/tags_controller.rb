class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
    @collections = current_user.collections
  end

  def create
    @tag = Tag.new(name: tag_params[:name])
    @tag.save
    movies_id = tag_params[:movie_ids].drop(1)
    collections = current_user.collections.where(movie_id: movies_id)
    collections.each do |collection|
      TagCollection.create!(collection_id: collection.id, tag_id: @tag.id)
    end

    redirect_to tags_path(@tag)
  end

  def edit
  end

  def update
    @tag.update(tag_params)
    redirect_to tags_path(@tag)
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end


   private
  def set_tag
    @tag = Tag.find(params[:id])
  end
  def tag_params
    params.require(:tag).permit(:name, movie_ids:[])
  end
end
