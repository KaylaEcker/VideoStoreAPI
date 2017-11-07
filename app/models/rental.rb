class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  validates :due_date, presence: true
  validates :check_out_date, presence: true
  # validate :movie_available?, :on => :save
  #
  # def movie_available?
  #   movie = self.movie
  #   if movie
  #     if movie.available?
  #       return true
  #     end
  #   end
  #   return false
  # end
end
