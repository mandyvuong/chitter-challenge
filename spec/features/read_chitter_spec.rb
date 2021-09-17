require 'pg'

feature 'chitter homepage' do
  scenario 'user can see peeps' do
    connection = PG.connect :dbname => 'chitter_test'
    Peeps.create(peep: 'boredom kills')
    Peeps.create(peep: 'hello')
    visit '/chitter'
    expect(page).to have_content 'boredom kills'
    expect(page).to have_content 'hello'
  end
end