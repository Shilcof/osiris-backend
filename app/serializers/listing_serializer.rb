class ListingSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :image_url, :seller_email

  def image_url
    if object.image.attached?
      url_for(object.image)
    end
  end

  def seller_email
    object.seller.email
  end
end
