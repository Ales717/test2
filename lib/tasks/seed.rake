task update_movie: :environment do
movie_seed = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV["MOVIE_API_KEY"]}&page=1"))
movie_seed['results'].each do |movie|
  Movie.create(
    movie_id: movie['id'],
    title: movie['title'],
    release_date: movie['release_date'],
    poster_path: movie['poster_path'],
    backdrop_path: movie['backdrop_path'],
    overview: movie['overview'],
    average_vote: movie['vote_average']
  )
end
end

task update_trailer: :environment do
trailer_seed = JSON.parse(RestClient.get("https://youtube.googleapis.com/youtube/v3/search?channelId=UCT0hbLDa-unWsnZ6Rjzkfug&key=#{ENV["YOUTUBE_API_KEY"]}"))
trailer_seed['items'].each do |trailer|
  Trailer.create(
    videoId: trailer['id']['videoId']
  )
end
end