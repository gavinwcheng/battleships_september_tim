  require 'spec_helper'



  feature 'Starting a new game' do
    scenario 'When go to the game I can see it is called Battleships' do
      visit '/'
      expect(page).to have_content "Battleships"
    end

    scenario 'I am asked to enter my name' do
      visit '/'
      click_link 'New Game'
      expect(page).to have_content "Please enter your name?"
    end

    scenario 'I enter my name and am presented with my new board' do
      visit '/new_game'
      fill_in('name', :with => 'Philip')
      click_button 'Start'
      expect(page).to have_content 'Hello Philip - Welcome to Battleships'
    end


    scenario 'I am presented with a new board' do
      visit '/start_game'
      expect(page).to have_selector('#board')
    end

    xscenario 'I have a list of ships' do
      visit '/start_game'
      expect(page).to have_content "Your Ships"
    end

    xscenario 'I can see a button to Place the Aircraft Carrier' do
      visit '/start_game'
      expect(page).to have_button "Place Aircraft Carrier"
    end

    xscenario 'I can see a button to Place the Battleship' do
      visit '/start_game'
      expect(page).to have_button "Place Battleship"
    end

    xscenario 'I can see a button to Place the Destroyer' do
      visit '/start_game'
      expect(page).to have_button "Place Destroyer"
    end

    xscenario 'I can see a button to Place the Submarine' do
      visit '/start_game'
      expect(page).to have_button "Place Submarine"
    end

    xscenario 'I can see a button to Place the Patrol Boat' do
      visit '/start_game'
      expect(page).to have_button "Place Patrol Boat"
    end


  end
