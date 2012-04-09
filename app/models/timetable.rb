class Timetable < ActiveRecord::Base
  belongs_to :dentist, :class_name => "Dentist", :foreign_key => "dentist_id"
end
