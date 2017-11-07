class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie
  validates :due_date, presence: true
  validates :check_out_date, presence: true
end
