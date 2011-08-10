class SettingsController < ApplicationController
  before_filter :not_put
  
  def base
    flash[:notice] = I18n.t("setting.base.successful") if current_user.update_attributes(params[:user])  
  end

  def notification
  end

  def binding
  end

  protected
  
  def not_put
    render("#{params[:action]}") unless request.put?
  end
end
