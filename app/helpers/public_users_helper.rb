module PublicUsersHelper
   def gravatar_for(public_user, options = { :size => 50 })
    gravatar_image_tag(public_user.email.downcase, :alt => public_user.name,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
