require 'rails_helper'

RSpec.describe 'studio index page' do
  it "shows the studio's attributes and titles of the movies associated with it" do
    studio = Studio.create!(name: 'Universal', location: 'Orlando')
    movie = Movie.create!(title: 'Jaws', studio_id: studio.id)
    movie2 = Movie.create!(title: 'War of the worlds', studio_id: studio.id)

    studio2 = Studio.create!(name: 'Disney', location: 'Orlando')
    movie3 = Movie.create!(title: 'Happy Gilmore', studio_id: studio2.id)
    movie4 = Movie.create!(title: 'Halloween', studio_id: studio2.id)

    visit '/studios'
    
    expect(page).to have_content(studio.name)
    expect(page).to have_content(studio.location)
    expect(page).to have_content(studio2.name)
    expect(page).to have_content(studio2.location)

    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie2.title)
    expect(page).to have_content(movie3.title)
    expect(page).to have_content(movie4.title)
  end
end
