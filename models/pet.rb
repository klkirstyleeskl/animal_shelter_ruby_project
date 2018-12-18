require_relative('../db/sql_runner')
require_relative('owner')
require('pry')


class Pet

  attr_accessor :name, :age, :type, :ready, :owner_id, :image
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age']
    @type = options['type']
    @ready = options['ready']
    @owner_id = options['owner_id'].to_i  if options['owner_id']
    @image = options['image']
  end

  def owner()
    return Owner.new({}) if !@owner_id
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [@owner_id]
    result = SqlRunner.run(sql, values)
    return Owner.new(result.first)
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

      def update()
        sql = "UPDATE pets
        SET
        (
          name,
          age,
          type,
          ready,
          owner_id
          ) =
          (
          $1, $2, $3, $4, $5
        )
        WHERE id = $6"
        values = [@name, @age, @type, @ready, @owner_id, @id]
        SqlRunner.run(sql, values)
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

    def delete()
      sql = "DELETE FROM pets
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
   end

end
