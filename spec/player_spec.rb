require 'spec_helper'

describe 'Player' do

   it 'tells which team a player belongs to' do
     team = Team.create({:team_name => "team name"})
     player = Player.create({:player_name => "player name", :team_id => team.id})
     expect(player.team).to eq (team)
   end


  describe ".has_not_performed" do
    it 'returns the players who are still waiting to play their turn' do
      not_performed_player = Player.create({:player_name => "Lionel Messi", :performed => false})
      not_performed_player2 = Player.create({:player_name => "Cristiano Ronaldo", :performed => false})
      not_performed_players = [not_performed_player, not_performed_player2]
      performed_player = Player.create({:player_name => "Gareth Bale", :performed => true})
      expect(Player.has_not_performed).to eq (not_performed_players)
    end
  end
end
