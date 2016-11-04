require "imdb"
require "pry"
class Movies
	def self.get_posters(str,number)
		search = Imdb::Search.new(str)
		movies = []
		i=0
		# replace 9 for number parameter
		while movies.size<number

			poster = search.movies[i].poster
			title = search.movies[i].title
			poster_hash = {poster: poster, title: title}
			movies.push(poster_hash) if poster != nil
			i+=1
		end
		movies
	end
end