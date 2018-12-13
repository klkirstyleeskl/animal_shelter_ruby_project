require_relative('../db/sql_runner')

class Pet

  attr_accessor :name, :age, :type, :ready
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age']
    @type = options['type']
    @ready = options['ready']
  end

  def save()
    sql = "INSERT INTO pets
    (
      name,
      age,
      type,
      ready
      )
      VALUES
      (
        $1, $2, $3, $4
      )
        RETURNING id"
        values = [@name, @age, @type, @ready]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id
      end

    def self.delete_all()
      sql = "DELETE FROM pets"
      values = []
      SqlRunner.run(sql, values)
    end





end
