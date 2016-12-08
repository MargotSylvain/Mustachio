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

    url = "https://www.omdbapi.com/?t=#{@title}&y=#{@year}&plot=short&r=json"

    movie = open(url).read

    movie_obj = JSON.parse(movie)
    raise
    @imdb_id = movie_obj["imdbID"] #=> returns id as a string
    @imdb_title = movie_obj["Title"] #=> returns id as a string
    @imdb_genre = movie_obj["Genre"]
  end

end
