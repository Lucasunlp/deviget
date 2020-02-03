class Game < ApplicationRecord
  belongs_to :user
  enum status: [:playing, :game_over, :game_won]

  belongs_to :user
  has_many :boxes, dependent: :delete_all

  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cant_mines, presence: true, numericality: { only_integer: true, greater_than: 0}

  before_create :default_status
  after_create :build_boxes

  private

  def boxes_count
    width * height
  end

  def default_status
    self.status = Game::statuses[:playing]
  end

  def build_boxes
    width.times do |x|
      height.times do |y|
        boxes.create x: x, y: y
      end
    end
  end
end
