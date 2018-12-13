# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( jqBootstrapValidation.js )
Rails.application.config.assets.precompile += %w( agency.js )
Rails.application.config.assets.precompile += %w( faq.js )
Rails.application.config.assets.precompile += %w( toastr.js )
Rails.application.config.assets.precompile += %w( global.js )
Rails.application.config.assets.precompile += %w( masonry.pkgd.js )
Rails.application.config.assets.precompile += %w( spree/mobile.js )


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
