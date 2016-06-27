class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Nice::Authenticate
  include Nice::Editing
  include Nice::Localize
  include Nice::Logger
  include Nice::Rescue

  def paper_trail_enabled_for_controller
    false
  end

  # rescue_from Exception, with: :debug_breakpoint

  def debug_breakpoint(exception = nil)
    exception
  end
end
