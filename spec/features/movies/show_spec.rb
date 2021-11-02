require 'rails_helper'

RSpec.describe 'movies show page' do
  it "shows the movie's attributes, actors from youngest to oldest, and average age of actors" do
    studio = Studio.create!(name: 'Universal', location: 'Orlando')
    movie = Movie.create!(title: 'Jaws', creation_year: 2016, genre: 'Horror', studio_id: studio.id)

    adam_sandler = Actor.create!(name: 'Adam Sandler', age: 40)
    david_spade= Actor.create!(name: 'David Spade', age: 50)
    chris_farley = Actor.create!(name: 'Chris Farley', age: 30)

    ActorMovie.create!(actor_id: adam_sandler.id, movie_id: movie.id)
    ActorMovie.create!(actor_id: chris_farley.id, movie_id: movie.id)
    ActorMovie.create!(actor_id: david_spade.id, movie_id: movie.id)

    visit "/movies/#{movie.id}"

    expect(chris_farley.name).to appear_before(adam_sandler.name)
    expect(adam_sandler.name).to appear_before(david_spade.name)
    expect(page).to have_content(40)
  end
end
