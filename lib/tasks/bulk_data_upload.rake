
require 'csv'

namespace :bulk_data_upload do
  desc "TODO"
  task create_assets: :environment do
  	csv_text = File.read("#{Rails.root}/public/Asset_Management_Form.csv")
		csv = CSV.parse(csv_text, :headers => true)

		csv.each do |row|
			count = 0
			array_data = row.to_a
			user = User.where("lower(name) LIKE ? ", "%#{array_data[1][1].downcase}%").first
			next unless user
			next if array_data.select{ |item| item[0] == "Laptop"}[0][1].present? || ((array_data.select{ |item| item[0] == "Laptop"}[0][1]&.length || 0) > 3 || false)
			begin
				array_data.drop(2).each_slice(3) do |a,b,c|
					next if a[1].blank? && a[0] != 'Laptop'
					if a[0] != 'Laptop'
						puts "ll = #{a[1]}"
						data = user.company_assets.create!(asset_type: 0, asset_sub_category_id: AssetSubCategory.find_by(name: a[0].split(" ")).id, sr_no: a[1], company_name: b[1], model_no: c[1], company_id: Company.find_by_name("Thinkbiz").id)
					elsif a[0] == 'Laptop' &&  a[1].blank?
						cpu = user.company_assets.find_by(asset_sub_category_id: AssetSubCategory.find_by(name: "CPU"))
						cpu.update_column(:description, "#{b[0]} = #{b[1]}, #{c[0]} = #{c[1]}")
					end
			 	end
			rescue Exception => e
			 	 puts "Error occured #{e}"
			end
		end


  end

end
