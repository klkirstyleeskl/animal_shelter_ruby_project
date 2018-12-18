require_relative('../db/sql_runner')

class Owner

  attr_accessor :first_name, :last_name, :telephone_number
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @telephone_number = options['telephone_number'].to_i
 end

 def pet()
   sql = "SELECT * FROM pets
          WHERE owner_id = $1"
   values = [@id]
   results = SqlRunner.run(sql, values)
   return results.map { |hash| Pet.new( hash )}
   return Pet.new({}) if result == nil
 end

 def pretty_name()
   return "#{@first_name} #{@last_name}"
 end

def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      telephone_number
    )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@first_name, @last_name, @telephone_number]
      result = SqlRunner.run(sql, values)
      id = result.first['id']
      @id = id
    end

    def update()
      sql = "UPDATE owners
      SET
      (
        first_name,
        last_name,
        telephone_number
        ) =
        (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@first_name, @last_name, @telephone_number, @id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM owners"
      values = []
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM owners"
      results = SqlRunner.run( sql )
      return results.map { |hash| Owner.new( hash ) }
    end

    def self.find( id )
      sql = "SELECT * FROM owners
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run( sql, values )
      return Owner.new( results.first )
    end

    def delete()
      sql = "DELETE FROM owners
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
   end

end
