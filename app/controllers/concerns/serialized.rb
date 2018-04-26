module Serialized
  extend ActiveSupport::Concern

  def render_errors(object)
    render plain: object.errors.full_messages.join(', '), status: :forbidden
  end

  def render_json_message(message)
    render json: { message: message }, status: :ok
  end

  def publish_broadcast(item, target = controller_name.singularize)
    if item.errors.any?
      render_errors(item)
    else
      file = helpers.c("#{controller_name}_#{target}", target.to_sym => item)

      ActionCable.server.broadcast target, message: file, id: item.id
      render_json_message('')
    end
  end
end
