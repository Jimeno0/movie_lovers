require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative 'lib/movies'

set :haml, format: :html5
enable(:sessions)

@@words = ['funny','stars','scary','lion']
@@score = 0

get('/movies') do
  last_word = @@words.sample
  @@words.delete_if{|word| word == last_word}
  search = Movies.search_movie(last_word)
  @score = @@score
  @@score+=1
  @movies = Movies.get_posters(search,9)
  @year = Movies.get_random_movie_year(search,9)

  return redirect to('/winner') if @@words == []
  erb(:movies)
end


get ('/winner') do 
  erb(:winner)
end
