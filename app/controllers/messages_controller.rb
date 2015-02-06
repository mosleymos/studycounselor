class MessagesController < ApplicationController
  #require 'sinatra'
  require 'pusher'
  require 'json'

  
  
  include Rack::Utils

  def chat
    chat_info = params[:chat_info]
    channel_name = nil

    if( !chat_info )
      render :body => 'chat_info must be provided', :status => :bad_request
    return
    end

    if( !request.referer )
      render :body => 'channel name could not be determined from request.referer', :status => :bad_request
    return
    end
    
    if params[:chat_info][:channelname].empty?
      channel_name = get_channel_name(request.referer)
    else
      channel_name = get_channel_name(params[:chat_info][:channelname].to_s)
    end
    
    

    #channel_name = get_channel_name(request.referer)
    options = sanitise_input(chat_info)
    
    if counselor_signed_in?
      counselor = current_counselor
      puts "Counselor signed in"
      channel_name = counselor.pusher_channel_name
      display_name = counselor.full_name
      options['displayName'] = display_name
      if !counselor.image_url.to_s.blank?
        image_path = root_url.to_s + counselor.image_url.to_s
      else
        image_path = root_url.to_s + "/counselor.jpg"
      end
      options['image'] = {'url' => image_path, 'height' => '48', 'width' => '48'}
      options['get_gravatar'] = false
    end
    

    activity = Activity.new('chat-message', options['text'], options)

    data = activity.getMessage()
    response = Pusher[channel_name].trigger('chat_message', data)

    result = {'activity' => data, 'pusherResponse' => response}
    render :body => result.to_json, :status => :ok, :headers => {'Cache-Control' =>  'no-cache, must-revalidate', 'Content-Type' =>  'application/json'}
    return

  end

  def get_channel_name(http_referer)
    pattern = /(\W)+/
    channel_name = http_referer.gsub pattern, '-'
    return channel_name
  end

  def sanitise_input(chat_info)
    email = chat_info['email']?chat_info['email']:''

    options = {}
    options['displayName'] = escape_html(chat_info['nickname']).slice(0, 30)
    options['text'] = escape_html(chat_info['text']).slice(0, 300)
    options['email'] = escape_html(email).slice(0, 100)
    options['get_gravatar'] = true
    return options
  end
end
