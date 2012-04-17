class Schedule < CowModel
	belongs_to :dentist
	belongs_to :patient 

  scope :by_dentist, lambda{|parameter| where("dentist_id = ?", parameter)}
  scope :end, lambda {|end_time| {:conditions => ["date < ?", Schedule.format_date(end_time)] }}
  scope :start, lambda {|start_time| {:conditions => ["date >= ?", Schedule.format_date(start_time)] }}
  

	def as_json(options = {})
      time_end = time + 30*60
   	  {
		    :id => self.id,
		    :title => self.patient_name + ' [' + self.phone + '] / Obs: ' + self.obs[0..10],
        :description => self.patient_name, #self.description || "",
        :start => date.to_datetime.change({:hour => time.hour, :min => time.min}),
        :end => date.to_datetime.change({:hour => time_end.hour, :min => time_end.min}),
        :allDay => self.reminder,
        :recurring => false,
        :url => ''#Rails.application.routes.url_helpers.schedule_path(id)
      }
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

end
