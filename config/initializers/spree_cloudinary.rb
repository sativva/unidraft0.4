# See the section titled 'Ruby On Rails integration' at http://cloudinary.com/documentation/rails_integration
# for full options.

Cloudinary.config do |config|
  config.cloud_name = 'uni-draft'
  config.api_key = ENV['CLOUDINARY_API']
  config.api_secret = ENV['CLOUDINARY_SECRET']
  config.cdn_subdomain = true
end
