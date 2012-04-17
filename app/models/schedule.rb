class Schedule < CowModel
	belongs_to :dentist
	belongs_to :patient 

  scope :by_dentist, lambda{|parameter| where("dentist_id = ?", parameter)}
  scope :end, lambda {|end_time| {:conditions => ["date < ?", Schedule.format_date(end_time)] }}
  scope :start, lambda {|start_time| {:conditions => ["date >= ?", Schedule.format_date(start_time)] }}
  

	def as_json(options = {})
      time_end = time + 30*60
      background_color = ''
      if self.status == 2
        background_color = '#53A853'
      end
      if self.status == 3
        background_color = '#DB643D'
      end
   	  {
		    :id => self.id,
		    :title => self.patient_name + ' [' + self.phone + '] / Obs: ' + self.obs[0..10],
        :description => self.patient_name, #self.description || "",
        :start => date.to_datetime.change({:hour => time.hour, :min => time.min}),
        :end => date.to_datetime.change({:hour => time_end.hour, :min => time_end.min}),
        :allDay => self.reminder,
        :recurring => false,
        :backgroundColor => background_color,
        :borderColor => background_color,
        :textColor => '',
        :url => ''#Rails.application.routes.url_helpers.schedule_path(id)
      }
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  def date_str
    self.date.to_s
  end

  def date_str=(value)
    self.date = value
  end

end
