class SettingsController < ApplicationController
  before_filter :authenticate_user!, :not_put
  
  def base
    flash[:notice] = I18n.t("setting.base.successful") if current_user.preference.update_attributes(params[:preference])  
  end

  def binding
  end

  protected
  
  def not_put
    render("#{params[:action]}") unless request.put?
  end
end
