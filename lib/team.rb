class Team < ActiveRecord::Base
  has_many :players

  validates :team_name, {:presence => true, :length => { :maximum => 50 }}

  before_save :upcase_team_name



private

  def upcase_team_name
    self.team_name=(team_name.titleize)
  end
end
