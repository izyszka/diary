class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @rate = Rate.new

    @rates_array = [[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8],[9,9],[10,10]]

    if @movie.rates.count == 0
      @rating = 0
    else
      @rating = @movie.rates.average(:rate)
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_path
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path
  end

  private

  def movie_params
    params[:movie].permit(:title, :director)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
end
