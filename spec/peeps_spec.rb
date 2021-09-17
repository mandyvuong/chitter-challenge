require 'peeps'
require 'timecop'

describe Peeps do
  describe '.create' do
    it 'creates new peep (message)' do
      peep = Peeps.create(message: 'hello!! anyone there!')
      expect(peep.message).to eq 'hello!! anyone there!'
      expect(peep.time_stamp).not_to be_nil
    end
  end

  describe '.read' do
    it 'reads peeps (message)' do
      connection = PG.connect :dbname => 'chitter_test'
      peep = Peeps.create(message: 'hello!! anyone there!')
      expect(peep.id).to eq peep.id
      expect(peep.message).to eq 'hello!! anyone there!'
      expect(peep.time_stamp).not_to be_nil
    end
  end
end