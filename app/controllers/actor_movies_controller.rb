class ActorMoviesController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: params[:name])
    ActorMovie.create!(movie_id: movie.id, actor_id: actor.id)
    redirect_to "/movies/#{movie.id}"
  end
end
