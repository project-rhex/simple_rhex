module ApplicationHelper
  def current_user
    @current_user ||= OpenStruct.new(JSON.parse(request.headers['HTTP_X_AUTH'])["info"])
    @current_user
  end
end
