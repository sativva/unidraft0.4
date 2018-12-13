Devise.secret_key = "2964643fc96bf16767f25a251833b178c95ca5fc49283fd927744e994b2d283f886b168c28dc120c155e5f05cd547770bb47"
# Devise.setup do |config|
#   config.omniauth :facebook, ENV["FB_ID"], ENV["FB_SECRET"], scope: 'email', info_fields: 'email, first_name,last_name', image_size: 'large'
# end
Devise.setup do |config|
  # Required so users don't lose their carts when they need to confirm.
  config.allow_unconfirmed_access_for = 1.days

  # Fixes the bug where Confirmation errors result in a broken page.
  config.router_name = :spree
  config.mailer_sender = 'hello@unidraft.co'
  # Add any other devise configurations here, as they will override the defaults provided by spree_auth_devise.
end

