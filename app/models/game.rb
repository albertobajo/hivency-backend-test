class Game < ApplicationRecord
  has_many :moves

  accepts_nested_attributes_for :moves
end
