class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
      object.errors[attribute] << I18n.t("mongoid.errors.models.invitation.attributes.email.invalid")
    end
  end
end