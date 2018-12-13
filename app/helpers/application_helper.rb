module ApplicationHelper
  def variant_price(variant)
    if Spree::Config[:show_variant_full_price]
      variant_full_price(variant)
    else
      variant_price_diff(variant)
    end
  end

  # returns the formatted price for the specified variant as a difference from product price
  def variant_price_diff(variant)
    variant_amount = variant.amount_in(current_currency)
    product_amount = variant.product.amount_in(current_currency)
    return if variant_amount == product_amount || product_amount.nil?
    diff   = variant.amount_in(current_currency) - product_amount
    amount = Spree::Money.new(diff.abs, currency: current_currency).to_html
    label  = diff > 0 ? :add : :subtract
    "(#{Spree.t(label)}: #{amount})".html_safe
  end

  # returns the formatted full price for the variant, if at least one variant price differs from product price
  def variant_full_price(variant)
    product = variant.product
    unless product.variants.active(current_currency).all? { |v| v.price == product.price }
      Spree::Money.new(variant.price, { currency: current_currency }).to_html
    end
  end

  # converts line breaks in product description into <p> tags (for html display purposes)
  def product_description(product)
    description = if Spree::Config[:show_raw_product_description]
                    product.description
                  else
                    product.description.to_s.gsub(/(.*?)\r?\n\r?\n/m, '<p>\1</p>')
                  end
    description.blank? ? Spree.t(:product_has_no_description) : raw(description)
  end

  def line_item_description_text description_text
    if description_text.present?
      truncate(strip_tags(description_text.gsub('&nbsp;', ' ').squish), length: 100)
    else
      Spree.t(:product_has_no_description)
    end
  end

  def cache_key_for_products
    count = @products.count
    max_updated_at = (@products.maximum(:updated_at) || Date.today).to_s(:number)
    products_cache_keys = "spree/products/all-#{params[:page]}-#{max_updated_at}-#{count}"
    (common_product_cache_keys + [products_cache_keys]).compact.join("/")
  end

  def cache_key_for_product(product = @product)
    (common_product_cache_keys + [product.cache_key, product.possible_promotions]).compact.join("/")
  end

  def available_status(product) # will return a human readable string
    return Spree.t(:discontinued)  if product.discontinued?
    return Spree.t(:deleted)  if product.deleted?

    if product.available?
      Spree.t(:available)
    elsif product.available_on && product.available_on.future?
      Spree.t(:pending_sale)
    else
      Spree.t(:no_available_date_set)
    end
  end

  # VOTES2

    def display_likes(event)
      votes = event.votes_for.up.by_type(Spree::User)
      # return list_likers(votes) if votes.size <= 8
      count_likers(votes)
    end

  # VOTES2


  private

  def list_likers(votes)
    usernames = []
    unless votes.blank?
      votes.voters.each do |voter|
      usernames.push(voter)
    end
    usernames.count
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    'each { |e|  } likes this'
  end

  def common_product_cache_keys
    [I18n.locale, current_currency] + price_options_cache_key
  end

  def price_options_cache_key
    current_price_options.sort.map(&:last).map do |value|
      value.try(:cache_key) || value
    end
  end
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
end
