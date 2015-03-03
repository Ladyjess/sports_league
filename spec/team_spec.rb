require 'spec_helper'

describe Team do
  it 'tells which players belong to a teams' do
    team = Team.create({:team_name => "team"})
    player1 = Player.create({:player_name => "player1", :team_id => team.id})
    player2 = Player.create({:player_name => "player2", :team_id => team.id})
    expect(team.players).to eq ([player1, player2])
  end

  it 'validates the presence of team' do
    team = Team.new({:team_name => ""})
    expect(team.save).to eq (false)
  end

  it "ensures the length of team name is at most 50 characters" do
    team = Team.new({:team_name => "a".*(51)})
    expect(team.save).to eq (false)
  end

  it 'converts the name to uppercase each first letter in a word' do
    team = Team.create({:team_name => "belgium football club"})
    expect(team.team_name).to eq ("Belgium Football Club")
  end
end
