class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    if Movie.create(movie_params)
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    Movie.update(params[:id], movie_params)
    redirect_to movie_path
  end

  private

  def movie_params
    params[:movie].permit(:title, :director)
  end
end
