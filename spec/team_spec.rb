require 'spec_helper'

describe Team do
  it 'tells which players belong to a teams' do
    team = Team.create({:team_name => "team"})
    player1 = Player.create({:player_name => "player1", :team_id => team.id})
    player2 = Player.create({:player_name => "player2", :team_id => team.id})
    expect(team.players).to eq ([player1, player2])
  end
end
