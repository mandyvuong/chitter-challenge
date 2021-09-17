require 'pg'

class Peeps
  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{peep}');")
  end

  def self.read
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    peeps = connection.exec "SELECT * FROM peeps ORDER BY id DESC"
    peeps.map { |peep| peep['message'] }
  end
end