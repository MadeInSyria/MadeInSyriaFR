class Contactmailer < ActionMailer::Base
  default from: "blog@madeinsyria.fr"
  default to: "omar@alaouf.com"

  def send_contact(params)
    @config = params
    mail :subject => @config[:subject]
  end
end
