ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  class_attr_index = html_tag.index 'class="'

  if class_attr_index
    html_tag.insert class_attr_index+7, 'error '
  else
    html_tag.insert html_tag.index('>'), ' class="error"'
  end
  
  unless html_tag =~ /^<label/
    %{<div class="has-error">#{html_tag}<span class="help-block">#{instance.error_message.first}</span></div>}.html_safe
  else
    %{#{html_tag}}.html_safe
  end
end
