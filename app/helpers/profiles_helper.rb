module ProfilesHelper
  def profile_link(user)
    if user.profile.present?
      link_to "Profile", profile_path(user.profile)
    else
      link_to "Create Profile", new_profile_path
    end
  end
end
