namespace :djKhaled do
  desc "calls api (every hour) to find and create new movies for the mustachio db"
  task :anotha_one => :environment do
  hit_list = [{title:"The Shawshank Redemption", year:"1994"},
    {title:"The Godfather", year:"1972"},
    {title:"The Godfather: Part II", year:"1974"},
    {title:"The Dark Knight", year:"2008"},
    {title:"12 Angry Men", year:"1957"},
    {title:"Schindler's List", year:"1993"},
    {title:"Pulp Fiction", year:"1994"},
    {title:"The Lord of the Rings: The Return of the King", year:"2003"},
    {title:"The Good, the Bad and the Ugly", year:"1966"},
    {title:"Fight Club", year:"1999"},
    {title:"The Lord of the Rings: The Fellowship of the Ring", year:"2001"},
    {title:"Star Wars: Episode V - The Empire Strikes Back", year:"1980"},
    {title:"Forrest Gump", year:"1994"},
    {title:"Inception", year:"2010"},
    {title:"The Lord of the Rings: The Two Towers", year:"2002"},
    {title:"One Flew Over the Cuckoo's Nest", year:"1975"},
    {title:"Goodfellas", year:"1990"},
    {title:"The Matrix", year:"1999"},
    {title:"Seven Samurai", year:"1954"},
    {title:"Star Wars: Episode IV - A New Hope", year:"1977"},
    {title:"City of God", year:"2002"},
    {title:"Se7en", year:"1995"},
    {title:"The Silence of the Lambs", year:"1991"},
    {title:"It's a Wonderful Life", year:"1946"},
    {title:"The Usual Suspects", year:"1995"},
    {title:"Life Is Beautiful", year:"1997"},
    {title:"Léon: The Professional", year:"1994"},
    {title:"Spirited Away", year:"2001"},
    {title:"Saving Private Ryan", year:"1998"},
    {title:"Once Upon a Time in the West", year:"1968"},
    {title:"American History X", year:"1998"},
    {title:"Interstellar", year:"2014"},
    {title:"Casablanca", year:"1942"},
    {title:"Psycho", year:"1960"},
    {title:"City Lights", year:"1931"},
    {title:"The Green Mile", year:"1999"},
    {title:"The Intouchables", year:"2011"},
    {title:"Terminator 2: Judgment Day", year:"1991"},
    {title:"The Pianist", year:"2002"},
    {title:"The Departed", year:"2006"},
    {title:"Back to the Future", year:"1985"},
    {title:"Whiplash", year:"2014"},
    {title:"Gladiator", year:"2000"},
    {title:"Memento", year:"2000"}]

  @title = hit_list[0][:title]
  @year = hit_list[0][:year]

  # @movie  = Movie.where("title ILIKE ?", "%#{@title}%").find_by({year: [(@year-1)..(@year+1)] })
  @movie  = Movie.find_by({title: @title, year: @year})
        # if(hit_list[0][:year].empty? && @title.empty?)
        # end
        if @movie
          hit_list.delete_at(0)
        else
              # Call api
          @movie = call_api_rake
          hit_list.delete_at(0)
        end


        private

    def call_api_rake

      require 'json'
      require 'open-uri'
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
      Movie.create(title: imdb_title, synopsis: imdb_synopsis, trailer: "", media_type: imdb_media_type, year: imdb_year, imdb_id: imdb_id, mdb_id: tmdb_id, genre: imdb_genre, backdrop_url: tmdb_back_drop, photo_url: imdb_photo)
    end #end call_api_rake

  end # end anotha_one
end # end of djKhaled
