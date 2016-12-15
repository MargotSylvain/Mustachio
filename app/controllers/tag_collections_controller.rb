class TagCollectionsController < ApplicationController
  #before_action :find_collection, only: [:create]
  before_action :find_tag_collection, only: [:show, :edit, :update, :destroy]

  def index
    current_user.tag_collections
  end

  def show
  # will show in the collections page
  end

  def new
    # @tag_collection = Tag_collection.new
    # this should be on the collections 'show' controller
  end

  def create
    movie = Movie.find(params[:tag_collection][:movie_id])
    my_collection = Collection.create(movie: movie, user: current_user)
    @tag_collection = TagCollection.new(tag_id: params[:tag_collection][:tag_id], collection: my_collection )


    if @tag_collection.save
      flash[:notice] = 'your tag_collection has been published'
      redirect_to collections_path
    else
      flash[:notice] = 'tag_collection invalid'
      redirect_to collections_path
    end
  end

  def edit
  end

  def update
    @tag_collection.update(tag_collection_params)
    #redirect_to collection_path(@tag_collection)
  end

  def destroy
    @tag_collection.destroy
    #redirect_to collection_path(@tag_collection)
  end

private
  def find_collection
    @collection = Collection.find(params[:collection_id])
    # ^ this becuase the routes are set to collections/collection_id/tag_collection
  end
  def find_tag_collection
    @tag_collection = Tag_collection.find(params[:id])
  end
  def tag_collection_params
    params.require(:tag_collection).permit(:collection_id, :tag_id)
  end

end
