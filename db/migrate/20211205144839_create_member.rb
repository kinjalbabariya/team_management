class CreateMember < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
    	t.string :name
    	t.timestamps null: false
    end
  end
end
