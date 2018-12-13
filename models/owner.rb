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

end
