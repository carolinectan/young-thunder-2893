class AddActorsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :actors, foreign_key: true
  end
end
