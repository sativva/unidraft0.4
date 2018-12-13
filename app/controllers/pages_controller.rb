class PagesController < Spree::StoreController

  def faq
  end

  def about
  end

  def you_are_designer
  end

  def robots
    respond_to :text
    expires_in 6.hours, public: true
  end
end
