def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  Movie 
  .select(:id, :title)
  .joins(:actors)
  .where(actors: {name: those_actors})
  .group(:id)
  .having('COUNT(actors.id) = ?', those_actors.length)
end
  # .group_by('movies.id')

# .where('castings.ord = 1')

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .group('yr-(yr%10)')
    .order('AVG(movies.score) DESC')
    .limit(1)
    .pluck('yr-(yr%10)')[0]
end
    # SELECT yr-(yr%10) AS "decade", AVG(score) 
    # FROM movies 
    # GROUP BY "decade" 
    # ORDER BY AVG(score) DESC 
    # LIMIT 1;

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  movie_titles = Movie.select(:title)
  .joins(:actors)
  .where(actors: { name: name } )
  
  Actor
  .joins(:movies)
  .where('movies.title = (?)', movie_titles)
  .pluck(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  # Actor
  # .select('COUNT(actors.name)')
  # .left_outer_joins(:movies)
  # .where('movies.title IS NULL')


  Actor
  .select(:name)
  .left_outer_joins(:movies)
  .where('movies.title IS NULL')
  .count
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
