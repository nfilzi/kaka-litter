module Mailers
  module Orders
    class SendConfirmationToUser
      def initialize(order, user)
        @order  = order
        @user   = user
      end

      def call
        OrderMailer.confirmation(@order, @user).deliver_now
      end
    end
  end
end
