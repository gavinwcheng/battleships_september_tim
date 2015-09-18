  require 'spec_helper'

  feature 'Starting a new game' do
    scenario 'I am asked to enter my name' do
      visit '/'
      click_link 'New Game'
      expect(page).to have_content "Please enter your name?"
    end

    scenario 'I am presented with a new board' do
      visit '/new_game'
      click_button 'Start'
      expect(page.find(:css,'#board'))
    end

    scenario 'when I am presented with a new board' do
      visit '/new_game'
      fill_in('name', :with => 'philip')
      click_button 'Start'
      expect(page).to have_content 'Hello philip - Welcome to Battleships'
    end

    scenario 'I have a list of ships' do
      visit '/start_game'
      expect(page).to have_content "Your Ships"
    end

    scenario 'I can see a button to Place the Aircraft Carrier' do
      visit '/start_game'
      expect(page).to have_button "Place Aircraft Carrier"
    end

    scenario 'I can see a button to Place the Battleship' do
      visit '/start_game'
      expect(page).to have_button "Place Battleship"
    end

    scenario 'I can see a button to Place the Destroyer' do
      visit '/start_game'
      expect(page).to have_button "Place Destroyer"
    end

    scenario 'I can see a button to Place the Submarine' do
      visit '/start_game'
      expect(page).to have_button "Place Submarine"
    end

    scenario 'I can see a button to Place the Patrol Boat' do
      visit '/start_game'
      expect(page).to have_button "Place Patrol Boat"
    end


  end
