class AddPerformedToPlayers < ActiveRecord::Migration
  def change
   add_column :players, :performed, :boolean
  end
end
