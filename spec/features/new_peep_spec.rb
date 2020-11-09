feature 'making a new peep' do
  scenario 'a user can enter a peep to chitter' do
    visit '/peeps/new'
    fill_in('message', with: 'TGIF!')
    click_button('PEEP')

    expect(page).to have_content 'TGIF!'
  end
end
