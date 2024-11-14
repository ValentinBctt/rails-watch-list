class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list


  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: "a déjà été ajouté à cette liste" }

end
