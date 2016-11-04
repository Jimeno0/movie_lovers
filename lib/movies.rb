require "imdb"
require "pry"
class Movies

	def self.search_movie(str)
		search = Imdb::Search.new(str)
	end

	def self.get_posters(search,number)
		movies = []
		i=0
		while movies.size<number
			poster = search.movies[i].poster
			title = search.movies[i].title
			year = search.movies[i].year
			poster_hash = {poster: poster, title: title, year: year}
			movies.push(poster_hash) if poster != nil
			i+=1
		end
		movies
	end

	def self.get_random_movie_year(search,size)
		i = (1..size).to_a.sample
		search.movies[i].year
	end


end