class PagesController < ApplicationController
  include ApplicationHelper
  def show
      render template: "pages/#{params[:page]}"
  end
end
