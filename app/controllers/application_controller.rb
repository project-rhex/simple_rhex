require 'no_user_exception'

class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from 'NoUserException' do |e|
    if production?
      render :text => "403 Forbidden", :status => 403
    else
      render "no_user_exception", :status => 403
    end
    "no user"
  end
  
  private
  
  def record_not_found
    render :text => "404 Not Found", :status => 404
  end

  def production?
    @is_production ||=(ENV['RAILS_ENV']=='production')
    @is_production
  end
end
