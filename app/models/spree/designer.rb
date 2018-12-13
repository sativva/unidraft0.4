module Spree
  class Designer < Spree::Base
    attr_accessor :file_file_name
    acts_as_followable
    has_attached_file :file,
                      styles: { small: '100x100>', large: '600x600>' },
                      default_style: :large,
                      storage: :cloudinary,
                      url: ':basename',
                      path: ':spree/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    has_attached_file :avatar,
                      styles: { medium: "300x300>", thumb: "100x100>" },
                      default_url: "/images/:style/missing.png",
                      default_style: :medium,
                      storage: :cloudinary,
                      url: ':basename',
                      path: ':spree/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    has_attached_file :banner,
                      styles: { large: '1000x600>', medium: "300x300>", thumb: "100x100>" },
                      default_url: "/images/:style/missing.png",
                      default_style: :medium,
                      storage: :cloudinary,
                      url: ':basename',
                      path: ':spree/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
    has_attached_file :video,
                      styles: { medium: "300x300>", thumb: "100x100>" },
                      default_url: "/images/:style/missing.png",
                      default_style: :medium,
                      storage: :cloudinary,
                      url: ':basename',
                      path: ':spree/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  end
end
