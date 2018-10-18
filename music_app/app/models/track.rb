class Track < ApplicationRecord
  # validates :lyrics, :name, :ord, presence: true
  # validates :bonus, inclusion: { in: [true, false] }
  # validates :ord, uniqueness: { scope: :album_id }

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: 'Album'

  has_one :band,
    through: :album,
    source: :band

  # has_many :notes,
  #   primary_key: :id,
  #   foreign_key: :

  after_initialize :set_defaults

  def set_defaults
    self.bonus ||= false
  end
end
