class ListingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  # attributes :id, :name, :description
  attributes :id, :name, :description, :image_url

  def image_url
    if object.image.attached?
      url_for(object.image)
    end
  end
end
