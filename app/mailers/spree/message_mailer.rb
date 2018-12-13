module Spree
  class MessageMailer < ActionMailer::Base

    default from: "hello@unidraft.co"


    def new_message(message)
      @message = message
      mail(to: "hello@unidraft.co",
               subject: "!! new message !!").deliver
    end
  end
end
