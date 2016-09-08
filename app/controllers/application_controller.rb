class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :error, :alert
  before_filter :set_year_global


  private

  def set_year_global
    cookies.signed_or_encrypted[:year] ? @year = cookies.signed_or_encrypted[:year] : @year = get_current_year
  end

  def get_current_year
    Year.all.each do |y|
      temp = y.value.split(/-/)
      if is_in_year(temp[0],temp[1])
        cookies.signed_or_encrypted.permanent[:year] = y
        return y
      end
    end
  end

end
