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

    if @movie.rates.count ==0
      @rating = 0
    else
      @rating = @movie.rates.sum(:rate)/@movie.rates.count
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
