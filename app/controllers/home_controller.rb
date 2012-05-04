class HomeController < ApplicationController
	before_filter :authorize 
	def index
	end

	def print
		report = ODFReport::Report.new("#{Rails.root.to_s}/app/reports/template01.odt") do |r|

			r.add_field(:user_name, 'Hamilton Neto')

		end

		report_file_name = report.generate

		send_file(report_file_name)

	end
end
