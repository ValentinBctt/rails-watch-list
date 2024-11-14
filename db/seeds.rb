# db/seeds.rb

# Supprimer toutes les données existantes
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "All movies, lists, and bookmarks have been deleted."

# Créer quelques listes fictives
lists = []
5.times do
  lists << List.create(name: Faker::Lorem.word.capitalize)
end

# Créer quelques films fictifs
20.times do
  movie = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Lorem.paragraph(sentence_count: 3),
    poster_url: Faker::Internet.url(host: 'example.com', path: '/poster.jpg'),
    rating: rand(1.0..10.0).round(1)
  )

  # Vérifier si le film a bien été créé
  if movie.persisted?
    puts "Created movie: #{movie.title}"

    # Associer le film à des listes aléatoires
    selected_lists = lists.sample(rand(1..3))
    movie.lists << selected_lists

    # Créer des signets pour chaque liste à laquelle le film est associé
    selected_lists.each do |list|
      Bookmark.create(
        movie: movie,  # Associe correctement le film
        list: list,
        comment: Faker::Lorem.sentence(word_count: 8)
      )
    end
  else
    puts "Failed to create movie: #{movie.errors.full_messages.join(', ')}"
  end
end

puts "Seed data has been created successfully!"
