require('pry')
require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

movie_1 = Movie.new({
  'title' => 'One Flew Over The Cuckoos Nest',
   'genre' => 'Comedy'})

   movie_2 = Movie.new({
     'title' => 'Spiderman',
      'genre' => 'Action'})

movie_1.save()
movie_2.save()

binding.pry
nil
