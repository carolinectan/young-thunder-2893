require 'rails_helper'

RSpec.describe 'the Studio index page' do
  it 'can list all the studios' do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    paramont = Studio.create!(name: 'Paramont Pictures', location: 'Chicago')
    columbia = Studio.create!(name: 'Columbia Pictures', location: 'New York')

    visit '/studios'

    expect(page).to have_content('All Studios')

    expect(page).to have_content(warner.name)
    expect(page).to have_content(paramont.name)
    expect(page).to have_content(columbia.name)
  end

  it 'can list all studio locations' do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    paramont = Studio.create!(name: 'Paramont Pictures', location: 'Chicago')
    columbia = Studio.create!(name: 'Columbia Pictures', location: 'New York')

    visit '/studios'

    expect(page).to have_content(warner.location)
    expect(page).to have_content(paramont.location)
    expect(page).to have_content(columbia.location)
  end

  it 'can list underneath each studio the titles of all of its movies' do
    warner = Studio.create!(name: 'Warner Bros', location: 'Los Angeles')
    paramont = Studio.create!(name: 'Paramont Pictures', location: 'Chicago')
    columbia = Studio.create!(name: 'Columbia Pictures', location: 'New York')

    hitch = warner.movies.create!(title: 'Hitch', creation_year: 2005, genre: 'Romantic Comedy')
    legend = paramont.movies.create!(title: 'I Am Legend', creation_year: 2007, genre: 'Sci Fi')
    mib = paramont.movies.create!(title: 'Men in Black', creation_year: 2012, genre: 'Sci Fi')
    pursuit = columbia.movies.create!(title: 'The Pursuit of Happyness', creation_year: 2006, genre: 'Drama')

    visit '/studios'

    within "#studio-#{warner.id}" do
      expect(page).to have_content(hitch.title)
    end

    within "#studio-#{paramont.id}" do
      expect(page).to have_content(legend.title)
      expect(page).to have_content(mib.title)
    end

    within "#studio-#{columbia.id}" do
      expect(page).to have_content(pursuit.title)
    end
  end
end
