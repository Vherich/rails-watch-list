class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  def image_url
    return "https://example.com/default.jpg" if movies.empty?

    movies.first.poster_url
  end
end
