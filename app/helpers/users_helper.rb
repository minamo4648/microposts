module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def intro(id)
    
    user = User.find(id)
    
          if user.soul.present?
            
            intro = Micropost.find_by(id: user.soul).content[0,50]
            
              if Micropost.find_by(id: user.soul).content.length > 50
                intro = intro + "..."
              end
            
          else
            intro = user.profile
          end
    
  end
  
end