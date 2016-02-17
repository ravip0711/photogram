module ApplicationHelper

  # Form for post image
  def form_image_select(post)
    return image_tag post.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end

  # Profile Avatar
  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                    id: 'image-preview',
                    class: 'img-responsive img-circle profile-image' if user
  .avatar.exists?
    image_tag 'default-avatar.png', id: 'image-preview',
                                    class: 'img-responsive img-circle profile-image'
  end


  # Alert flash types
  def alert_for(flash_type)
    case flash_type
      when :success
        "alert-success"   # Green
      when :error
        "alert-danger"    # Red
      when :alert
        "alert-warning"   # Yellow
      when :notice
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end
end
