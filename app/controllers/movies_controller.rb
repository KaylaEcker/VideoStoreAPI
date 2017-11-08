class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render(
    json:movies.as_json(only: [:id, :title, :release_date]),
    status: :ok
    )
  end

  def show
    movie = Movie.find_by(id: params[:id])
    if movie
      render json:movie,
      status: :ok
    else
      render json: {ok: false }, status: :not_found
    end
  end

  def create
    movie = Movie.create(movie_params)

    if movie.valid?
      render json:movie.as_json(only: [:id, :title, :release_date]),
      status: :ok
    else
      render json: {ok: false }, status: :bad_request
    end
  end

  private
  def movie_params
    params.permit(:release_date, :title)
  end
end
