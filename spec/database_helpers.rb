# require 'pg'

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'chitter')
#   result = connection.query("SELECT * FROM peep WHERE id = #{id};")
#   result.first
# end