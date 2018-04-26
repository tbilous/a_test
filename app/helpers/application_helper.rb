module ApplicationHelper
  def render_flash
    javascript_tag('App.flash = JSON.parse(' "'#{j({ success: flash.notice, error: flash.alert }.to_json)}'" ');')
  end

  def v_component(component_name, locals = {}, &block)
    path = component_name.split('_').first
    name = component_name.split('_').last
    render("#{path}/#{name}", locals, &block)
  end

  def component(component_name, locals)
    path = component_name.split('_').first
    name = component_name.split('_').last
    ApplicationController.render file: "/#{path}/_#{name}", locals: locals, layout: false
  end

  alias c component
  alias v v_component
end
