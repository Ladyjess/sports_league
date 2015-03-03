class Team < ActiveRecord::Base
  has_many :players

  validates :team_name, {:presence => true, :length => { :maximum => 50 }}

end
