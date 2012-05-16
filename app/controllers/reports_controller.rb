require 'util' 

class ReportsController < CowController
  include ConvertMoney
	inherit_resources
	
	def estimate
	  estimate = Estimate.find_by_id(params[:estimate_id])
	  
	  report = ODFReport::Report.new("#{Rails.root.to_s}/app/reports/estimate.odt") do |r|

			r.add_field(:patient_name, estimate.patient.name)
			r.add_field(:total, to_format_br(estimate.total))
			r.add_field(:discount, to_format_br(estimate.discount))
			r.add_field(:final_value, to_format_br(estimate.final_value))

			@procedures = estimate.estimateprocedures

			r.add_table("TABLE_PROCEDURES", @procedures, :header=>true) do |t|
			  t.add_column(:procedure_name)
				t.add_column(:amount)
				t.add_column(:value_br)
				t.add_column(:item_total)
			end
			
			@payments = estimate.estimatepayments

			r.add_table("TABLE_PAYMENTS", @payments, :header=>true) do |t|
			  t.add_column(:payment_name)
				t.add_column(:value)
				t.add_column(:quotes)
			end

		end

		report_file_name = report.generate

		send_file(report_file_name)
  end
end