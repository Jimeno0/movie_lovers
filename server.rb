require 'sinatra'
require 'haml'
require 'pry'
require "sinatra/reloader" if development?
require_relative 'lib/movies'

set :haml, format: :html5
enable(:sessions)

get '/' do
  erb(:index)
end

post '/get_movies' do
  search = Movies.search_movie(params[:title])
  session[:movies] = Movies.get_posters(search,9)
  session[:year] = Movies.get_random_movie_year(search,9)
  redirect to('/movies')

end 

get('/movies') do
  @movies = session[:movies]
  @year = session[:year]
  erb(:movies)
end