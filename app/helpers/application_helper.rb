module ApplicationHelper
  def shallow_resource(*args)
    if args.last.persisted?
      args.last
    else
      args
    end
  end

  def render_flash
    javascript_tag('App.flash = JSON.parse(' "'#{j({ success: flash.notice, error: flash.alert }.to_json)}'" ');')
  end
end
