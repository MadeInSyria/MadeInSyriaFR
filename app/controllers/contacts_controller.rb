class ContactsController < ApplicationController
   def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(post_params)
    if @contact.valid?
      Contactmailer.send_contact(params[:contact]).deliver
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
