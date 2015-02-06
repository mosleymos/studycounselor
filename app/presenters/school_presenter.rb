class SchoolPresenter < BasePresenter
  presents :school
  delegate :name, to: :school #Full name methods in on the model school
  
  
  def avatar
    if !school.image_url.to_s.empty?
       site_link image_tag(school.image_url.to_s, class: "profile-image img-responsive pull-left", alt: school.name.to_s)
    else
       site_link image_tag("school.gif", class: "profile-image img-responsive pull-left", alt: school.name.to_s)
    end
  end
  
  def contact_mail
    handle_none school.contact_mail.to_s do
      return school.contact_mail.to_s
    end
  end

  def linkedin
    if school.linkedin_url
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-linkedin"), school.linkedin_url)
      end
    end
  end
  
  def facebook
    if school.facebook_url
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-facebook"), school.facebook_url)
      end
    end
  end
  
  def twitter
    if school.twitter_url
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-twitter"), school.twitter_url)
      end
    end
  end
  
  def google_plus
    if school.google_plus_url && !school.google_plus_url.empty?
      h.content_tag :li do 
        h.link_to(h.content_tag(:i, nil, class: "fa fa-google-plus"), school.google_plus_url)
      end
    end
  end
  
  def address
    handle_none school.address do
      return school.address
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
      h.content_tag :span, "Non renseigné", class: "none"
    end
  end

  def site_link(content)
    h.link_to(content, h.school_path(school))
  end

  def avatar_name
    if user.avatar_image_name.present?
      user.avatar_image_name
    else
      "default.png"
    end
  end
end