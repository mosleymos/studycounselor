class Pusherlouis

  require 'pusher'

  Pusher.app_id = '103320'
  Pusher.key = 'c46da87d78625cf39e36'
  Pusher.secret = 'aec9f20df568da9bb617'

  def self.trigger_event(message = "Default message")
    Pusher.trigger('test-channel', 'louis-event', {:message => message})
  end
end