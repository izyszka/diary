class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    Movie.create(movie_params)

    redirect_to movies_path
  end

  private

  def movie_params
    params['movie'].permit(:title, :director)
  end
end
