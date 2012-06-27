class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def record_not_found
    render :text => "404 Not Found", :status => 404
  end
end
