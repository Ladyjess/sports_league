class Player < ActiveRecord::Base

  scope :has_not_performed, -> do
    where({:performed => false})
  end

  belongs_to :team
end
