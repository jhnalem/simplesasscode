class ContactMailer < ApplicationMailer
  def contact(name,email,body)
      @name =name
      @email=email
      @nbody=body
  end
end
