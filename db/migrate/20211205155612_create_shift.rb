class CreateShift < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
    	t.references :member, foreign_key: true
    	t.integer	 :day
    	t.time       :start_time
    	t.time       :end_time
    	t.timestamps null: false
    end
  end
end
