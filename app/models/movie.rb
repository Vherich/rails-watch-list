class Movie < ApplicationRecord
  before_destroy :ensure_no_bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  has_many :bookmarks, dependent: :restrict_with_error
  has_many :lists, through: :bookmarks

  private

  def ensure_no_bookmarks
    unless bookmarks.empty?
      errors.add(:base, "Cannot delete movie with bookmarks")
      throw :abort
    end
  end
end
