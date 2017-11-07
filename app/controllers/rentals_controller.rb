require 'date'
require "pry"
class RentalsController < ApplicationController
  def check_out
    movie = Movie.find_by(id: params[:movie_id])
    customer = Movie.find_by(id: params[:customer_id])
    if movie && customer
      rental = Rental.new(rental_params)
      today = Date.today
      today = today.strftime("%F")
      rental.check_out_date = today
      if rental.save
        render json:rental.as_json(only:[:movie_id, :due_date, :check_out_date, :customer_id, :id]),
        status: :ok
        return
      end
    end
    bad_request
  end

  private

  def rental_params
    params.permit(:movie_id, :due_date, :customer_id)
  end

  def bad_request
    render json: {ok: false }, status: :bad_request
    return
  end

end
