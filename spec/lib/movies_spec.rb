require_relative '../../lib/movies.rb'
require 'date'

RSpec.describe Movies do
  
  describe ".status" do
    context 'one element' do
      before(:all) {@movies = Movies.get_posters('funny',1)}
      it "works" do
        expect(@movies).to be_truthy
      end
      it 'returns an array same size than the parameter' do
        expect(@movies.size).to eq(1)      
      end
      it 'have a title' do
        expect(@movies[0][:title]).to be_truthy
      end
      it 'have a psoter url' do
        expect(@movies[0][:poster]).to be_truthy           
      end  
    end

    context 'three films' do
      before(:all) {@movies = Movies.get_posters('funny',3)}
      it 'returns an array wuth 3 elements' do
        expect(@movies.size).to eq(3) 
      end
    end
    
  end
end


