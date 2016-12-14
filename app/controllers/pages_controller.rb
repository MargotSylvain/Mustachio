class PagesController < ApplicationController

    skip_before_action :authenticate_user!, only: [:home,:search]
    # ^ :search authentication will be enable upon
  def home
  end

  def friends
    @users = User.all
    @user = User.find(current_user)
  end

  def search
      @collection = Collection.new
      @title = params[:movie][:title]
      @year = params[:movie][:year]
      # @movie  = Movie.where("title ILIKE ?", "%#{@title}%").find_by({year: [(@year-1)..(@year+1)] })
      # ^^modify year, without an integer
      @movie  = Movie.find_by("title ILIKE ?", "%#{@title}%")

      if(params[:movie][:year].empty? && @title.empty?)
        # flash[:notice] = 'Please enter a Movie title!'
        redirect_to collections_path and return
      end
      if @movie
        @movie
        # raise
         # flash[:notice] = 'Here is what we found'
        # redirect_to results_path (movie: @movie)
        # ^ this requires a controller function
        render :results
        # ^ this takes the @movie and simply displays it on the results page
      else
            # Call api
        @movie = call_api
          if @movie
          # raise
           flash[:notice] = 'Is this your movie?'
          # redirect_to results_path (movie: @movie)
          # ^ this requires a controller function
          render :results
          # ^ this takes the @movie and simply displays it on the results page
          else
          flash[:notice] = 'sorry your movie was not found!'
          redirect_to collections_path
          end
          # Parse params
          # Create object with all params
          # Store on database
          # Send the object to views
      end
  end

  private


  def call_api

    require 'json'
    require 'open-uri'
    begin
      # call imdb api for basic for movieID
      url = "https://www.omdbapi.com/?t=#{@title}&y=#{@year}&plot=short&r=json"
      movie = open(url).read
      movie_obj = JSON.parse(movie)
      # raise
      imdb_title = movie_obj["Title"] #=> returns id as a string
      imdb_synopsis = movie_obj["Plot"]
      # imdb photo works without using api routes or paths
      imdb_photo = movie_obj["Poster"]
      imdb_media_type = 1
      imdb_year = movie_obj["Year"].to_i
      imdb_id = movie_obj["imdbID"] #=> returns id as a string
      imdb_genre = movie_obj["Genre"]

      imdb_director = movie_obj["Director"]
      imdb_rated = movie_obj["Rated"]
      imdb_run_time = movie_obj["Runtime"]
      imdb_actor = movie_obj["Actors"]
      imdb_writer = movie_obj["Writer"]

      # raise
      # find backdrops in tmd:

      search = Tmdb::Find.movie(imdb_id, external_source: 'imdb_id')



      json_search = search.to_json

      parsed_tmdb  = JSON.parse(json_search)
      # raise
      # @tmdb_title = @parsed_tmdb[0]['table']['results'][0]['table']['title']
      tmdb_id = parsed_tmdb[0]['table']['id']
      tmdb_back_drop = "https://image.tmdb.org/t/p/original#{parsed_tmdb[0]['table']['backdrop_path']}"
      # raise
      Movie.create(title: imdb_title, synopsis: imdb_synopsis, trailer: "", media_type: imdb_media_type, year: imdb_year, imdb_id: imdb_id, mdb_id: tmdb_id, genre: imdb_genre, backdrop_url: tmdb_back_drop, photo_url: imdb_photo, director: imdb_director, rated: imdb_rated, run_time: imdb_run_time, actor: imdb_actor, writer: imdb_writer)
    rescue
      nil
    end
  end

end
