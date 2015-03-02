class RemovePreformedFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :performed, :boolean
  end
end
