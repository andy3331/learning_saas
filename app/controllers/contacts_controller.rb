class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
 
  #this is called when hitting submit form...
  #action=/contacts when inspecting element of html page ...as a post
  #rake routes shows POST   /contacts(.:format)          contacts#create
  #so we know that we must define the create method in the contacts controller which is below
  def create
    #create object with (contact_params)
    #define contact_params in private section below
    @contact = Contact.new(contact_params)
    
    if @contact.save
      #creating 3 variables from entered information
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      #calling contact_mailer.rb from mailers ...with parameters above
      ContactMailer.contact_email(name, email, body).deliver
      #flash notice displays on screen when put above yield in application.html.erb layout
      #<div class = "container">
      #called a flash hash
      
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      flash[:danger] = "Error occurred, message has not been sent."
      redirect_to new_contact_path
    end
  end

  private
  #white listing the contact form parameters
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end