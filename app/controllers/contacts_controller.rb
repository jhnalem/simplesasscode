class ContactsController < ApplicationController
    def new
        @contact=Contact.new
    end
    def create
        @contact=Contact.new(contact_params)
         if @contact.save 
             name= params[:contat][:name]
             email=params[:contat][:name]
             body= params[:contat][:body]
             flash[:success]="Message sent!"
             redirect_to new_contact_path
             
             ContactMailer.contact_email(name,email,body).deliver
         else
             flash[:danger]="Error occured"
             redirect_to new_contact_path
         end
    end
    private 
     def contact_params
         params.require(:contact).permit(:name,:email,:comments)
     end
end
