require 'pg'

class Peeps
  attr_reader :id, :message, :time_stamp

  def initialize(id:, message:, time_stamp:)
    @id  = id
    @message = message
    @time_stamp = time_stamp
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    result = connection.exec("INSERT INTO peeps (message, time_stamp) VALUES('#{message}', NOW()) RETURNING id, message, time_stamp ;")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], time_stamp: result[0]['time_stamp'])
  end

  def self.read
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    results = connection.exec "SELECT * FROM peeps ORDER BY id DESC"
    results.map do |peep| 
      Peeps.new(id: peep['id'], message: peep['message'], time_stamp: peep['time_stamp'])
    end
  end
end