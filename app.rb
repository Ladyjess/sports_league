require 'sinatra'
require 'sinatra/reloader'
also_reload './lib/**/*.rb'
require 'sinatra/activerecord'
require './lib/team.rb'
require './lib/player.rb'
require 'pg'
require 'pry'

get '/' do
  @teams = Team.all
  erb :index
end

post '/teams' do
  team_name = params["team_name"]
  team = Team.new({:team_name => team_name, :id => nil}).save
  @teams = Team.all
  redirect "/"
end

get '/teams/:id' do
  @team = Team.find(params["id"].to_i)
  erb :team
end

get '/teams/:id/edit' do
  @team = Team.find(params["id"].to_i)
  erb :team_edit
end

patch '/teams/:id' do
  team_name = params["team_name"]
  @team = Team.find(params["id"].to_i)
  @team.update({:team_name => team_name})
  erb :team
end

post '/players' do
  player_name = params["player_name"]
  team_id = params["team_id"].to_i
  player = Player.new({:player_name => player_name, :team_id => team_id})
  player.save
  @team = Team.find(team_id)
  erb :team
end
