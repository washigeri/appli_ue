class AdminController < ApplicationController
  def admin
    respond_to do |format|
      format.html
      format.js
    end
  end


end