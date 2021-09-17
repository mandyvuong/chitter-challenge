require 'peeps'

describe Peeps do
  describe '.create' do
    it 'creates new peep (message)' do
      Peeps.create(peep: 'hello!! anyone there!')   
      expect(Peeps.read).to include 'hello!! anyone there!'
    end
  end

  describe '.read' do
    it 'reads peeps (message)' do
      connection = PG.connect :dbname => 'chitter_test'
      connection.exec("INSERT INTO peeps (message) VALUES ('boredom kills');")
      connection.exec("INSERT INTO peeps (message) VALUES ('hello');")
      expect(Peeps.read).to include('boredom kills')
      expect(Peeps.read).to include('hello')
    end
  end
end