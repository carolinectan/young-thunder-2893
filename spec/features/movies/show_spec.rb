require 'rails_helper'

RSpec.describe 'the Movie show page' do
  it "can list the movie's title, creation year, and genre" do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    paramont = Studio.create!(name: 'Paramont Pictures', location: 'Chicago')
    columbia = Studio.create!(name: 'Columbia Pictures', location: 'New York')

    hitch = warner.movies.create!(title: 'Hitch', creation_year: 2005, genre: 'Romantic Comedy')
    legend = paramont.movies.create!(title: 'I Am Legend', creation_year: 2007, genre: 'Sci Fi')
    mib = paramont.movies.create!(title: 'Men in Black', creation_year: 2012, genre: 'Sci Fi')
    pursuit = columbia.movies.create!(title: 'The Pursuit of Happyness', creation_year: 2006, genre: 'Drama')

    visit "/movies/#{hitch.id}"

    expect(page).to have_content(hitch.title)
    expect(page).to have_content(hitch.creation_year)
    expect(page).to have_content(hitch.genre)
  end

  it "can list all the movie's actors from youngest to oldest" do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    paramont = Studio.create!(name: 'Paramont Pictures', location: 'Chicago')
    columbia = Studio.create!(name: 'Columbia Pictures', location: 'New York')

    hitch = warner.movies.create!(title: 'Hitch', creation_year: 2005, genre: 'Romantic Comedy')
    legend = paramont.movies.create!(title: 'I Am Legend', creation_year: 2007, genre: 'Sci Fi')
    mib = paramont.movies.create!(title: 'Men in Black', creation_year: 2012, genre: 'Sci Fi')
    pursuit = columbia.movies.create!(title: 'The Pursuit of Happyness', creation_year: 2006, genre: 'Drama')

    will = hitch.actors.create!(name: 'Will Smith', age: 45)
    eva = hitch.actors.create!(name: 'Eva Mendes', age: 41)
    kevin = hitch.actors.create!(name: 'Kevin James', age: 52)
    amber = hitch.actors.create!(name: 'Amber Valletta', age: 43)

    visit "/movies/#{hitch.id}"

    expect(page).to have_content("#{eva.name} #{eva.age}")
    expect(page).to have_content("#{eva.name} #{eva.age} #{amber.name} #{amber.age} #{will.name} #{will.age} #{kevin.name} #{kevin.age}")
    # why is the line break in the .each ignored and \n is replaced with a space?
  end

  it "can list the average age of all of the movie's actors" do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    paramont = Studio.create!(name: 'Paramont Pictures', location: 'Chicago')
    columbia = Studio.create!(name: 'Columbia Pictures', location: 'New York')

    hitch = warner.movies.create!(title: 'Hitch', creation_year: 2005, genre: 'Romantic Comedy')
    legend = paramont.movies.create!(title: 'I Am Legend', creation_year: 2007, genre: 'Sci Fi')
    mib = paramont.movies.create!(title: 'Men in Black', creation_year: 2012, genre: 'Sci Fi')
    pursuit = columbia.movies.create!(title: 'The Pursuit of Happyness', creation_year: 2006, genre: 'Drama')

    will = hitch.actors.create!(name: 'Will Smith', age: 45)
    eva = hitch.actors.create!(name: 'Eva Mendes', age: 41)
    kevin = hitch.actors.create!(name: 'Kevin James', age: 52)
    amber = hitch.actors.create!(name: 'Amber Valletta', age: 43)

    visit "/movies/#{hitch.id}"

    expect(page).to have_content("Average Age of Movie's Actors: 45")
  end
end
