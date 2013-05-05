class ApplicationController < ActionController::Base
  protect_from_forgery

protected

  def set_preview_mode
    @preview_mode = true
  end
end
