require 'sinatra/base'
require 'battleships'
class BattleshipsWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  get '/new_game' do
    $game = Game.new Player, Board
    erb :new_game
  end

  post '/new_game' do
    @name = params[:name]
    erb :new_game
  end

  get '/game' do
    erb :game
  end

  post '/game' do
    @battleship_coords = params[:battleshipcoords]
    @battleship_dir    = params[:battleshipdir]
    @sub_coords        = params[:subcoords]
    @sub_dir           = params[:subdir]

    redirect '/player1_board'
  end
  run! if app_file == $0
end
