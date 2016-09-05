# Returns a dynamic path based on the provided parameters
module Admin::OthersHelper
  def sti_other_path(type = "other", other = nil, action = nil)
    send "#{format_sti(action, type, other)}_path", other
  end

  def format_sti(action, type, other)
    action || other ? "#{format_action(action)}_#{type.underscore}" : "admin_#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_admin" : "admin"
  end
end