class Actor < ApplicationRecord
  belongs_to :movie

  def self.order_by_age
    self.order(age: :asc)
  end

  def self.average_age
    self.average(:age).to_i.round
  end
end
