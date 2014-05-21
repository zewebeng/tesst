module ActivitiesHelper
  def attached_image(activity)
    if activity.image_url.blank?
      image_tag 'https://lorempixel.com/g/200/200/', class: 'activity-image img-rounded'
    else
      image_tag activity.image_url, class: 'activity-image img-rounded'
    end
  end
end
