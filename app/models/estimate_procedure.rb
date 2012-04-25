class EstimateProcedure < ActiveRecord::Base
	belongs_to :estimate
	belongs_to :procedure
end
