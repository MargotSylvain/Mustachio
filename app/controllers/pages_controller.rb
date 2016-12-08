class PagesController < ApplicationController

    skip_before_action :authenticate_user!, only: [:home,:search]

  def home

  end
  def search
      @movie  = Movie.where(title: params[:movie][:title], year: params[:movie][:year].to_i)
      if movie.any?
        @movie
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
    raise
  end

end
