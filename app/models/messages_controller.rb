class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    respond_to do |format|
      if @message.valid?
        SendEnquiryEmail.perform!(message: @message)
        flash[:notice] = "Message sent! Thank you for contacting us."
        format.html { redirect_to contact_us_pages_path }
      else
        flash[:error] = "Unfortunately the message was unable to be sent please try again"
        format.html { redirect_to contact_us_pages_path }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :message_subject, :full_name, :email)
  end
end
