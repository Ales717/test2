task :update => :environment do
    movie_seed = JSON.parse(RestClient.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV["MOVIE_API_KEY"]}&page=2"))
    movie_seed['results'].each do |movie|
    Movie.where(
    movie_id: movie['id'],
    title: movie['title'],
    release_date: movie['release_date'],
    poster_path: movie['poster_path'],
    backdrop_path: movie['backdrop_path'],
    overview: movie['overview'],
    average_vote: movie['vote_average']
  ).first_or_create
  puts "done"
end
end