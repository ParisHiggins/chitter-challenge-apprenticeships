feature 'viewing peeps' do
  scenario 'a user can see peeps' do
    # add the test data
    Peeps.create(message: "This is my first peep!")
    Peeps.create(message: "You cant lock me down!!!")
    Peeps.create(message: "#overit")

    visit '/peeps'
    expect(page).to have_content "This is my first peep!"
    expect(page).to have_content "You cant lock me down!!!"
    expect(page).to have_content "#overit"
  end
end
