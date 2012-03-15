class CowController < ApplicationController
  before_filter :authorize  
  load_and_authorize_resource
end
