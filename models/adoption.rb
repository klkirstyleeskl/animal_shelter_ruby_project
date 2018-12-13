require_relative('../db/sql_runner')

class Adoption

attr_reader :id, :pet_id, :owner_id

  def initialize( options )
  @id = options['id'].to_i if options['id']
  @pet_id = options['pet_id'].to_i
  @owner_id = options['owner_id'].to_i
  end
  
  def save()
    sql = "INSERT INTO adoptions
    (
      pet_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@pet_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end




end
