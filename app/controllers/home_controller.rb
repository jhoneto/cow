class HomeController < ApplicationController
	before_filter :authorize 
	def index
	end

	def print
		report = ODFReport::Report.new("#{Rails.root.to_s}/app/reports/template01.odt") do |r|

			r.add_field(:user_name, 'Hamilton Neto')

			@list_of_itens = Group.all

			r.add_table("TABLE_1", @list_of_itens, :header=>true) do |t|
				t.add_column(:id)
				t.add_column(:name)
			end

		end

		report_file_name = report.generate

		send_file(report_file_name)

	end
end
