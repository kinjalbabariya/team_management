class CreateTeamMember < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
    	t.references :team, foreign_key: true
    	t.references :member, foreign_key: true
    	t.timestamps null: false
    end
  end
end
