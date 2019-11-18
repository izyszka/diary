class RatesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @rate = @movie.rates.build(rate_params)
    @rate.save

    redirect_to movie_path(@rate.movie)
  end

  private

  def rate_params
    params.permit(:rate, :movie_id)
  end
end