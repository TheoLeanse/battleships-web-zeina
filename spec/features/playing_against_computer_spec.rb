require 'spec_helper'

feature 'Playing against a computer' do
  scenario 'placing ships without error' do
    visit '/game'
    expect(page).to have_content "Battleship"
    expect(page).to have_content "Submarine"
    expect(page).to have_content "Coordinates"
    expect(page).to have_content "Direction"
    fill_in('battleshipcoords', with: "A1")
    fill_in('subcoords', with: "B1")
    fill_in('battleshipdir', with: "Horizontal")
    fill_in('subdir', with: "Vertical")
    click_on 'Place Ships'
    expect(page).to have_content 'Board with placed ships'
  end

end
