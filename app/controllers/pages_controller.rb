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
        result = call_api
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

    # call imdb api for basic for movieID
    url = "https://www.omdbapi.com/?t=#{@title}&y=#{@year}&plot=short&r=json"
    movie = open(url).read
    movie_obj = JSON.parse(movie)

    @imdb_id = movie_obj["imdbID"] #=> returns id as a string
    @imdb_title = movie_obj["Title"] #=> returns id as a string
    @imdb_genre = movie_obj["Genre"]

    # find backdrops in tmd:
    search = Tmdb::Find.movie(@imdb_id, external_source: 'imdb_id')

    json_search = search.to_json

    @parsed_tmdb  = JSON.parse(json_search)

    # @tmdb_title = @parsed_tmdb[0]['table']['results'][0]['table']['title']
    @tmdb_title = @parsed_tmdb[0]['table']['backdrop_path']
    raise
  end

end
