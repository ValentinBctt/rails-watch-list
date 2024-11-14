class Movie < ApplicationRecord
  has_many :bookmarks
  has_and_belongs_to_many :lists
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  # Validation personnalisée pour empêcher la suppression si des bookmarks existent
  validate :cannot_destroy_if_has_bookmarks, on: :destroy

  private

  def cannot_destroy_if_has_bookmarks
    if bookmarks.exists?
      errors.add(:base, "Impossible de supprimer un film qui a des signets associés")
      throw(:abort)  # Annule la destruction
    end
  end
end
