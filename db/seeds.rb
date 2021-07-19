Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

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
