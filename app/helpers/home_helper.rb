module HomeHelper
  def sogoke_error_message(source)
    error_message = ""
    source.errors.each do |attribute, error|
      error_message << "<li>#{error}</li>"
    end
    error_message
  end
end
