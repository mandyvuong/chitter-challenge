feature 'create a peep' do 
  scenario 'user can create a peep' do
    visit '/chitter/new'
    fill_in 'peep', with: 'message'
    click_button 'Submit'
    expect(page).to have_content 'message'
  end
end