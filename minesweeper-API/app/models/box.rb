class Box < ApplicationRecord
  belongs_to :game

  validates :x, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: :game_width }
  validates :y, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: :game_height }

  def game_width
    game.width
  end

  def game_height
    game.height
  end
end
