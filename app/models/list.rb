class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy  # Supprime tous les signets associés à la liste
  has_many :movies, through: :bookmarks     # Une liste a plusieurs films via les signets
  has_and_belongs_to_many :movies
  
  validates :name, presence: true, uniqueness: true
end
