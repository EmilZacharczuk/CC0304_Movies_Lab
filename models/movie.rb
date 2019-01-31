class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @genre = options['genre']
    @title = options['title']
  end

  def save()
    sql = "INSERT INTO movies
    (
      title
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@title]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM movies"
    values = []
    movies = SqlRunner.run(sql, values)
    result = movies.map { |movie| movie.new( movie ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    values = []
    SqlRunner.run(sql, values)
  end
  def locations()
    sql = "SELECT locations.*
    from locations
    INNER JOIN visits ON visits.location_id = locations.id
    WHERE visits.movie_id = $1
    "
    values = [@id]
    locations = SqlRunner.run(sql,values)  #pull location from PG array-type object
    results = locations.map {|location| Location.new(location)}
    return results
  end


end
