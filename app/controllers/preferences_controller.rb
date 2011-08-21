class PreferencesController < ApplicationController
  def edit
  end

  def update
    if current_user.preference.update_attributes(params[:preference])
      redirect_to edit_preference_path, notice: 'Preference was successfully updated.'
    else
      render :edit
    end
  end
end
