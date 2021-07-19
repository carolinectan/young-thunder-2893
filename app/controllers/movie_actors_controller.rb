class MovieActorsController < ApplicationController
  def new
  end

  def create
    # binding.pry
    movie = Movie.find(params[:id])

    actor = Actor.create!(actor_params)
    # redirect_to '/'
  end

private
  def actor_params
    params.permit(:name, :age)
  end
end
