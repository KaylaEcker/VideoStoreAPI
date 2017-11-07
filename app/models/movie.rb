class Movie < ApplicationRecord
  validates :title, presence: true

  def available?
    if self.inventory > 0
      return true
    else
      return false
    end
  end
end
