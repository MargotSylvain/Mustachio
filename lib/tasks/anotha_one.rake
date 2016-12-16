namespace :name do
  desc "this schedules the jobs and delay of execution"
  task :searchFlicks => :environment do
    flick_list =[{title:"The Shawshank Redemption", year:"1994"},
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
    {title:"Memento", year:"2000"},
    {title: "Zootopia", year:"2016"},
    {title: "Hell of High Water", year:"2016"},
    {title: "Arrival", year:"2016"},
    {title: "Moonlight", year:"2016"},
    {title: "Love and Friendship", year:"2016"},
    {title: "Finding Dory", year:"2016"},
    {title: "Hunt for the Wilderpeople", year:"2016"},
    {title: "Sing Street", year:"2016"},
    {title: "Embrace of the Serpent", year:"2015"},
    {title: "The Nice Guys", year:"2016"},
    {title: "Little Men", year:"2016"},
    {title: "10 Cloverfield Lane", year:"2016"},
    {title: "Doctor Strange", year:"2016"},
    {title: "The Dark Horse", year:"2014"},
    {title: "Deadpool", year:"2016"}]

    delay = 1
    flick_list.each do |flick|
      title = flick[:title]
      year = flick[:year]
      SetMovieJob.set(wait: 5 * delay.seconds).perform_later(title, year)
      delay+= 1
    end
  end

end
