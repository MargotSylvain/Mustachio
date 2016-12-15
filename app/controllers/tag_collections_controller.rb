class TagCollectionsController < ApplicationController
  def create
    @tag_collection = TagCollection.new(tag_collection_params)
    if @tag_collection.save
      flash[:notice] = 'your tag_collection has been published'
      redirect_to collections_path
    else
      flash[:notice] = 'tag_collection invalid'
      redirect_to collections_path
    end
  end

  private

  def tag_collection_params
    params.require(:tag_collection).permit(:collection_id, :tag_id)
  end
end
