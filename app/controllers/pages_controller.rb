class PagesController < ApplicationController

    skip_before_action :authenticate_user!, only: [:home,:search]

  def home

  end
  def search
      @title = params[:movie][:title]
      @year = params[:movie][:year]
      @movie  = Movie.where(title: @title, year: @year.to_i)

      if @movie.any?
        @movie
        raise
      else
            # Call api
        @movie = call_api
            # Parse params
            # Create object with all params
            # Store on database
            # Send the object to views
        redirect_to search_path, @movie

      end
  end

  private


  def call_api

    require 'json'
    require 'open-uri'

    # call imdb api for basic for movieID
    url = "https://www.omdbapi.com/?t=#{@title}&y=#{@year}&plot=short&r=json"
    movie = open(url).read
    movie_obj = JSON.parse(movie)

    imdb_title = movie_obj["Title"] #=> returns id as a string
    imdb_synopsis = movie_obj["Plot"]
    # imdb photo works without using api routes or paths
    imdb_photo = movie_obj["Poster"]
    imdb_media_type = "movie"
    imdb_year = movie_obj["Year"].to_i
    imdb_id = movie_obj["imdbID"] #=> returns id as a string
    imdb_genre = movie_obj["Genre"]
    # raise

    # find backdrops in tmd:
    search = Tmdb::Find.movie(imdb_id, external_source: 'imdb_id')

    json_search = search.to_json

    parsed_tmdb  = JSON.parse(json_search)
    #raise
    # @tmdb_title = @parsed_tmdb[0]['table']['results'][0]['table']['title']
    tmdb_id = parsed_tmdb[0]['table']['id']
    tmdb_back_drop = "https://image.tmdb.org/t/p/original/#{parsed_tmdb[0]['table']['backdrop_path']}"
    raise
    #Movie.create(title: imdb_title, synopsis: imdb_synopsis, photo: imdb_photo, backdrop: tmdb_back_drop, trailer: "", media_type: imdb_media_type, year: imdb_year, imdb_id: imdb_id, mdb_id: tmdb_id)
  end

end
