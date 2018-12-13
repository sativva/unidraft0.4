module Spree
  class MessagesController < Spree::StoreController
  # skip_before_action :authenticate_user!
    def new
      @message = Message.new
    end

    def create
      @message = Message.new(message_params)

      if @message.valid?
        Spree::MessageMailer.new_message(@message).deliver
        redirect_to root_path, notice: "Your messages has been sent."
      else
        flash[:alert] = "An error occurred while delivering this message."
        render :new
      end
    end

  private

    def message_params
      params.require(:message).permit(:name, :email, :content)
    end

  end
end
