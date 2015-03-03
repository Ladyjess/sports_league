class Player < ActiveRecord::Base

  scope :has_not_performed, -> do
    where({:performed => false})
  end

  belongs_to :team
  validates :player_name, {:presence => true, :length => { :maximum => 40 }}

end
