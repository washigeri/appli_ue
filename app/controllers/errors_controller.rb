class ErrorsController < ApplicationController
  include ApplicationHelper
  def not_found
    render(:status => :not_found, :file => 'public/404.html')
  end

  def internal_server_error
    render(:status => 500, :file => 'public/500.html')
  end
end
