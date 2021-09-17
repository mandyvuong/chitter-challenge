require 'pg'

feature 'chitter homepage' do
  scenario 'user can see peeps' do
    Peeps.create(peep: 'boredom kills')
    Peeps.create(peep: 'hello')
    visit '/chitter'
    expect(page).to have_content 'hello'
    expect(page).to have_content 'boredom kills'
  end
end