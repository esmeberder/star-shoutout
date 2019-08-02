class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  mount_uploader :video, VideoUploader
end
