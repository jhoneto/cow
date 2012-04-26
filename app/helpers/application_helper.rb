module ApplicationHelper
	def sanitized_object_name(object_name)
  object_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/,"_").sub(/_$/,"")
end

def sanitized_method_name(method_name)
  method_name.sub(/\?$/, "")
end

def form_tag_id(object_name, method_name)
  "##{sanitized_object_name(object_name.to_s)}_#{sanitized_method_name(method_name.to_s)}"
end

end
