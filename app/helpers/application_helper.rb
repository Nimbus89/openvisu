module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_fields_dyn(f, association, partial)
    fields = f.fields_for association do |builder|
      render partial, f: builder, value: ""
    end
    link_to("Add "+ association.singularize, '#', class: "add_fields_dyn btn btn-xs btn-info", data: { fields: fields.gsub("\n", "")})
  end

	def render_palette_item(item)
		render partial: "/editor/palette_items/#{item.name}"
	end

	def render_workspace_panel(item)
		
	end

  def render_properties_pane(panel)
    render partial: "/editor/properties_pane", locals: {panel: panel}
  end

  def editor_path(page)
    "/editor/" + page.id.to_s
  end

end

