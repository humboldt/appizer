class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # rescue_from Exception, with: :debug_breakpoint

  def debug_breakpoint(exception = nil)
    exception
  end
end
