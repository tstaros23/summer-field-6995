class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.average_age
    average(:age)
  end

  # def coactors
  #   wip = Actor.joins(movies: :actor_movies).where()
  #
  # end
end
