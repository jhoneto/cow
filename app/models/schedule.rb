class Schedule < CowModel
	belongs_to :dentist
	belongs_to :patient 


	def as_json(options = {})
      time_end = time + 30*60
   	  {
		:id => self.id,
		:title => self.patient_name,
        :description => self.patient_name, #self.description || "",
        :start => date.to_datetime.change({:hour => time.hour, :min => time.min}),
        :end => date.to_datetime.change({:hour => time.hour, :min => time_end.min}),
        :allDay => false, #false, #self.all_day,
        :recurring => false,
        :url => ''#Rails.application.routes.url_helpers.schedule_path(id)
      }
    end

end
