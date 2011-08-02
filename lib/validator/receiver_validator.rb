class ReceiverValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    receiver = User.where(:name => object.receiver_name).first
    if receiver.nil?
      object.errors[attribute] << I18n.t("message.nosuchuser")
    elsif receiver.id == object.sender_id
      object.errors[attribute] << I18n.t("message.yourself")
    elsif 
      object.receiver_id = receiver.id
    end
  end
end