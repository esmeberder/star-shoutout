class User < ApplicationRecord
  # using: {
  #   tsearch: { prefix: true } # <-- now `superman batm` will return something!
  # }
  has_many :services
  has_many :bookings
  include PgSearch
  pg_search_scope :global_search, against: [:name]
  mount_uploader :photo, PhotoUploader
  acts_as_taggable_on :tags
  $tags = ["Actor", "Broadway", "Musician", "Athlete", "Funny", "Dramatic", "Romantic Comedies", "ComicCon"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
