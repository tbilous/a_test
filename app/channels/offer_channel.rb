class OfferChannel < ApplicationCable::Channel
  def follow
    stop_all_streams
    stream_from 'offer'
  end

  def unfollow
    stop_all_streams
  end
end
