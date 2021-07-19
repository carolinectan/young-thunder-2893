require 'rails_helper'

RSpec.describe 'add actors to a movie' do
  it 'link to adding a new actor from a movie show page' do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    hitch = warner.movies.create!(title: 'Hitch', creation_year: 2005, genre: 'Romantic Comedy')
    will = hitch.actors.create!(name: 'Will Smith', age: 45)
    eva = hitch.actors.create!(name: 'Eva Mendes', age: 41)

    visit "/movies/#{hitch.id}"

    expect(page).to have_content(will.name)
    expect(page).to have_content(eva.name)
    expect(page).to_not have_content("Amber")
    expect(page).to_not have_content("Kevin")

    click_button('Add New Actor')

    expect(current_path).to eq("/movies/#{hitch.id}/add_new_actor")
  end
end
