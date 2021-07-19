class Actor < ApplicationRecord
  belongs_to :movie

  def self.order_by_age
    self.order(age: :asc)
  end
end
