require 'sinatra/base'
require_relative '../game_setup.rb'

class BattleshipsWeb < Sinatra::Base

  enable :sessions
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    erb :new_game
  end

  post '/new_game' do
    session[:name] = params[:name]
    redirect ('/start_game')
  end

  get '/start_game' do
    board = Board.new(Cell)
    @board = board.print_board
    @name = session[:name]
    erb :start_game
  end

  post '/place_ships' do
    session[:coords] = params[:coords]
    redirect ('/place_ships')
  end

  get '/place_ships' do
    @coords = session[:coords]
    erb :place_ships
  end

  post '/logout' do
    session[:name] = nil
    session.clear
    redirect 'http://www.bbc.co.uk'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
