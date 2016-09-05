class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :error, :alert
  before_filter :set_year_global


  private

  def set_year_global
    cookies[:year] ? @year = cookies[:year] : @year = get_current_year
  end

  def get_current_year

  end

end
