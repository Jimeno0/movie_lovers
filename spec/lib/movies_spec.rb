require_relative '../../lib/movies.rb'
require 'date'

RSpec.describe Movies do

  # describe ".search" do
  #   before(:all) do
  #     @search = Movies.search_movie('funny')
  #   end
  #   it "works" do
  #     expect(@search).to be_truthy
  #   end
  # end

  # describe ".status" do
  #   context 'one element' do
  #     before(:all) do 
  #       @search = Movies.search_movie('funny')
  #       @movies = Movies.get_posters(@search,1)
  #     end
  #     it 'returns an array same size than the parameter' do
  #       expect(@movies.size).to eq(1)      
  #     end
  #     it 'have a title' do
  #       expect(@movies[0][:title]).to be_truthy
  #     end
  #     it 'have a psoter url' do
  #       expect(@movies[0][:poster]).to be_truthy           
  #     end  
  #   end

  #   context 'three films' do
  #     before(:all) do 
  #       @search = Movies.search_movie('funny')
  #       @movies = Movies.get_posters(@search,3)
  #     end
  #     it 'returns an array wuth 3 elements' do
  #       expect(@movies.size).to eq(3) 
  #     end
  #   end
  # end

  describe ".get_random_movie_year" do
    before(:all) do
      @search = Movies.search_movie('funny')
      @movies = Movies.get_posters(@search,9)
      @random_year = Movies.get_random_movie_year(@search,9)
    end
    it "returns a number" do
      expect(@random_year).to be_kind_of(Integer)
    end

    it "movies contain the random year" do
      years = []
      @movies.each{|movie| years.push(movie[:year])}
      expect(years).to include(@random_year)
    end
  end
end


