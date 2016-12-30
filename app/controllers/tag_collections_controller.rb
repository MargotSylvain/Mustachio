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

  def destroy

    # @tag_collection = TagCollection.find(params[:id])

    # @tag_collection.destroy
    # redirect_to collections_path
  end



  private

  def tag_collection_params
    params.require(:tag_collection).permit(:collection_id, :tag_id)
  end
end
