class CounselorPresenter < BasePresenter
  presents :counselor
  delegate :full_name, to: :counselor #Full name methods in on the model counselor
  
  
  def avatar
    if counselor.image_url
       site_link image_tag(counselor.image_url.to_s, class: "profile-image img-responsive pull-left", alt: counselor.full_name.to_s)
    else
       site_link image_tag("http://cdn0.iconfinder.com/data/icons/PRACTIKA/256/user.png", class: "profile-image img-responsive pull-left", alt: counselor.full_name.to_s)
    end
  end

  def linkedin
    if counselor.linkedin_url
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-linkedin"), counselor.linkedin_url)
      end
    end
  end
  
  def facebook
    if counselor.facebook_url
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-facebook"), counselor.facebook_url)
      end
    end
  end
  
  def twitter
    if counselor.twitter_url
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-twitter"), counselor.twitter_url)
      end
    end
  end
  
  def google_plus
    if counselor.google_plus_url && !counselor.google_plus_url.empty?
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-google-plus"), counselor.google_plus_url)
      end
    end
  end
  
  def address
    handle_none counselor.address do
      return counselor.address
    end
  end

  def bio
    handle_none user.bio do
      markdown(user.bio)
    end
  end

private
  def handle_none(value)
    if value.present?
      yield
    else
      h.content_tag :span, "None given", class: "none"
    end
  end

  def site_link(content)
    h.link_to(content, h.counselor_path(counselor))
  end

  def avatar_name
    if user.avatar_image_name.present?
      user.avatar_image_name
    else
      "default.png"
    end
  end
end