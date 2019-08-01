class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'
  version :thumnail do
    resize_to_fit 256, 256
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:20", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end

  version :face do
    cloudinary_transformation effect: "brightness:0", radius: 0,
      width: 1000, height: 1000, crop: :thumb, gravity: :face
  end
end
