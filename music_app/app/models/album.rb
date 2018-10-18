
class Album < ApplicationRecord

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: 'Band'

  has_many :tracks
    primary_key: :id,
    foreign_key: :album_id,
    class_name: 'Track'

  validates :band, :name, :year, presence: true
  validates :live, inclusion: { in: [true, false] }
  validates :name, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maximum: 9000 }

  after_initialize :set_defaults

  def set_defaults
    self.live ||= false
  end
end
