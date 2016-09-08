class AdminController < ApplicationController
  before_filter :set_year_global, :authenticate_admin!, :require_admin
  def admin
    respond_to do |format|
      format.html
      format.js
    end
  end

  def require_admin
    unless current_admin.allowed?
      redirect_to :back, error: "Vous n'avez pas les droits nécessaires pour cette action !"
    end
  end

end