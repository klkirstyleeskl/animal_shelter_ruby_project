require_relative('../db/sql_runner')

class Pet

  attr_accessor :name, :age, :type, :ready, :owner_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age']
    @type = options['type']
    @ready = options['ready']
    @owner_id = options['owner_id'].to_i  if options['owner_id']
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @owner_id = id
  end

  def save()
    sql = "INSERT INTO pets
    (
      name,
      age,
      type,
      ready,
      owner_id
      )
      VALUES
      (
        $1, $2, $3, $4, $5
      )
        RETURNING id"
        values = [@name, @age, @type, @ready, @owner_id]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id
      end

    def self.delete_all()
      sql = "DELETE FROM pets"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM pets"
      results = SqlRunner.run( sql )
      return results.map { |hash| Pet.new( hash ) }
    end

   def self.find( id )
      sql = "SELECT * FROM pets
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Pet.new( results.first )
    end

    def self.destroy(id)
      sql = "DELETE FROM pets
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
   end

end
