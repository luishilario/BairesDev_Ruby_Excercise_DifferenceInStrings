class PersonMailer < ApplicationMailer
    def notify_new
        @person = params[:person]
        mail(to: "luis.hilario@bairesdev.com", subject: "Person Mailer")
    end
end
