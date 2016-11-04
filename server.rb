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
  title = params[:title]
  @movies = Movies.get_posters(title,9)
  # binding.pry
  erb(:movies)

end 