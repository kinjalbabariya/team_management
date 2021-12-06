namespace :bulk_user_upload do
  desc "TODO"
  task create_users: :environment do
		csv_file = "#{Rails.root}/public/users.csv"
		File.read(csv_file).split("\n").each_with_index do |row, index|
			next if index == 0
			name = row.split(",")[0]
			dob = row.split(",")[1]
			email = row.split(",")[2]
			join_date = row.split(",")[3]
			
			b_date = dob.to_date

			password = b_date.strftime("%d") + b_date.strftime("%m") + b_date.strftime("%y")
			if [1,2].include?(index)
				begin
					User.create!(name: name, email: email, dob: dob, join_date: join_date, password: password, company_id: 2, role: 0)
				rescue Exception => e
					puts e
					next
				end
			else
				begin
					User.create!(name: name, email: email, dob: dob, join_date: join_date, password: password, company_id: 2, role: 2)
				rescue Exception => e
					puts e
					next
				end
			end
		end
	end
end
