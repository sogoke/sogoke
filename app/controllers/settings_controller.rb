class SettingsController < ApplicationController
  before_filter :not_put
  
  def base
    flash[:notice] = I18n.t("settings.base.successful") if current_user.update_attributes(params[:users])  
  end

  def notification
  end

  def binding
  end

  def store
  end

  protected
  
  def not_put
    render("#{params[:action]}") unless request.put?
  end
end
