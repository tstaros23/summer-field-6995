require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'class methods' do
    describe '#average_age' do
      it "finds the actor's average age and sorts their age in descending order " do
        studio = Studio.create!(name: 'Universal', location: 'Orlando')
        movie = Movie.create!(title: 'Jaws', creation_year: 2016, genre: 'Horror', studio_id: studio.id)

        adam_sandler = Actor.create!(name: 'Adam Sandler', age: 40)
        david_spade= Actor.create!(name: 'Adam Sandler', age: 50)
        chris_farley = Actor.create!(name: 'Chris Farley', age: 30)

        ActorMovie.create!(actor_id: adam_sandler.id, movie_id: movie.id)
        ActorMovie.create!(actor_id: chris_farley.id, movie_id: movie.id)
        ActorMovie.create!(actor_id: david_spade.id, movie_id: movie.id)


        expect(Actor.average_age).to eq(40)
      end
    end
  end
end
