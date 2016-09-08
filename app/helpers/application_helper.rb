module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def params_present(key, hash,value)
    if not hash.nil?
      if hash.key?(key)
        if hash[key].include? value.to_s
          true
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def is_active(key, hash, value, action, controller)
      if params[:action] == action and params_present(key, hash, value) and params[:controller] == controller
        "active"
      else
        nil
      end
  end

  def index_ues_active(action, controller)
    if params[:action] == action and params[:controller] == controller and not params[:semestres].present?
      "active"
    else
      nil
    end

  end

  def is_in_year(year1, year2)
    date1 = Date.new(year1.to_i,9,1)
    date2 = Date.new(year2.to_i,8,31)
    c = Time.now
    (c > date1 and c < date2)
  end


end