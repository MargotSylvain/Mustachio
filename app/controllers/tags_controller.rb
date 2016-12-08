class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
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
    params.require(:tag).permit(:name)
  end
end
