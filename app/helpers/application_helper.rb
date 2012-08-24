require 'no_user_exception'
require 'ostruct'

module ApplicationHelper
  def current_user
    unless @current_user
      header = request.headers['HTTP_X_AUTH']
      raise NoUserException unless header
      header = OpenStruct.new(JSON.parse(header))["info"]
      @current_user ||= header
    end    
    @current_user
  end
end
